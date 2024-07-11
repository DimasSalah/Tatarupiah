import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tatarupiah/app/modules/home/data/models/transaction_model.dart';
import 'package:tatarupiah/app/modules/home/mixins/bar_chart_mixin.dart';
import 'package:tatarupiah/app/routes/app_pages.dart';

import '../../../data/global_controller/user_controller.dart';
import '../data/services/transaction_service.dart';

class HomeController extends GetxController with BarchartMixin {
  RxString image = "".obs;
  RxString name = "".obs;
  RxBool isVisible = false.obs;
  RxBool isLoading = false.obs;
  RxBool isFetchingMore = false.obs;
  RxBool hasMoreData = true.obs;
  RxList<TransactionHistory> transactionsList = <TransactionHistory>[].obs;
  RxInt totalProfit = 0.obs;
  RxInt totalTransaction = 0.obs;
  RxInt currentPage = 1.obs;

  final ScrollController scrollController = ScrollController();
  final transactionService = TransactionService();
  final UserController userController = UserController.to;

  Future<void> delTransaction(int id) async {
    try {
      await transactionService.deleteTransaction(id);
      transactionsList.removeWhere((element) => element.id == id);
      getProfit();
      fetchBarChartData();
      fetchTransaction();
    } catch (e) {
      Get.snackbar("Error", 'Gagal menghapus transaksi');
    }
  }

  Future<void> fetchTransaction() async {
    hasMoreData.value = true;
    try {
      isLoading.value = true;
      final transaction = await transactionService.getTransaction(
          startDate: DateFormat('yyyy-MM-dd').format(DateTime.now()),
          endDate: DateFormat('yyyy-MM-dd').format(DateTime.now()),
          page: currentPage.value);
      // print("Total from response: ${transaction.data.total}");
      totalTransaction.value = transaction.data.total;
      transactionsList.addAll(transaction.data.data);
      getProfit();
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchMoreTransactions() async {
    final transactionService = TransactionService();
    try {
      isFetchingMore.value = true;
      currentPage.value++;
      final value = await transactionService.getTransaction(
        startDate: DateFormat('yyyy-MM-dd').format(DateTime.now()),
        endDate: DateFormat('yyyy-MM-dd').format(DateTime.now()),
        page: currentPage.value,
      );
      if (value.data.data.isNotEmpty) {
        transactionsList.addAll(value.data.data);
        if (value.data.data.length < 15) {
          // Asumsikan 15 adalah jumlah item per halaman
          hasMoreData.value = false;
        }
      } else {
        hasMoreData.value = false;
      }
    } catch (e) {
      print(e);
    } finally {
      isFetchingMore.value = false;
    }
  }

  void _scrollListener() {
    if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent &&
        hasMoreData.value &&
        !isFetchingMore.value) {
      print('Reached the bottom of the list');
      fetchMoreTransactions();
    }
  }

  void navigationToTransaction() {
    Get.toNamed(Routes.TRANSACTION);
  }

  int getProfit() {
    totalProfit.value = 0;
    for (var transaction in transactionsList) {
      totalProfit +=
          transaction.nominalPenjualan - transaction.nominalPengeluaran;
    }
    return totalProfit.value;
  }

  @override
  void onInit() {
    scrollController.addListener(_scrollListener);
    super.onInit();
    // mybarData.initializeBarData();
    fetchBarChartData();
    dropdownValue.value = "Pemasukan";
    currentWeek();
    fetchTransaction();
  }
}
