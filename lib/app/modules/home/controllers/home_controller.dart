import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tatarupiah/app/data/api/profile_service.dart';
import 'package:tatarupiah/app/modules/home/data/models/transaction_model.dart';
import 'package:tatarupiah/app/modules/home/views/components/bar%20graph/bar_data.dart';
import 'package:tatarupiah/app/routes/app_pages.dart';

import '../data/services/transaction_service.dart';

class HomeController extends GetxController {
  RxDouble maxY = 200.0.obs;
  RxInt selectedBarIndex = 0.obs;
  RxString dropdownValue = "Pemasukan".obs;
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

  Future<void> getProfile() async {
    final profileService = ProfileService();
    await profileService.getUser().then((value) {
      image.value = value.data.image;
    });
  }

  Future<void> fetchTransaction() async {
    final transactionService = TransactionService();
    try {
      isLoading.value = true;
      final transaction = await transactionService.getTransaction(
          DateFormat('yyyy-MM-dd').format(DateTime.now()),
          DateFormat('yyyy-MM-dd').format(DateTime.now()),
          currentPage.value);
      print("Total from response: ${transaction.data.total}");
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
        DateFormat('yyyy-MM-dd').format(DateTime.now()),
        DateFormat('yyyy-MM-dd').format(DateTime.now()),
        currentPage.value,
      );
      if (value.data.data.isNotEmpty) {
        transactionsList.addAll(value.data.data);

        if (value.data.data.length < 15) {
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

  void navigationToHistory() {
    Get.toNamed(Routes.HISTORY);
  }

  int getProfit() {
    totalProfit.value = 0;
    for (var transaction in transactionsList) {
      totalProfit +=
          transaction.nominalPenjualan - transaction.nominalPengeluaran;
    }
    return totalProfit.value;
  }

  void setSelectedBarIndex(FlTouchEvent event, BarTouchResponse? response) {
    if (response != null && response.spot != null) {
      final int tappedIndex = response.spot!.touchedBarGroupIndex;
      selectedBarIndex.value = tappedIndex;
      update();
    }
  }

  void setSelected(String value) {
    dropdownValue.value = value;
  }

  Bardata mybarData = Bardata(
    sunAmmount: 25.40,
    monAmmount: 56.90,
    tueAmmount: 30.40,
    wedAmmount: 43.20,
    thuAmmount: 24.49,
    friAmmount: 100.34,
    satAmmount: 30.53,
  );

  void updateMyBarData(List<double> newData) {
    // Periksa apakah nilai baru melebihi maxY
    if (newData.any((value) => value > maxY.value)) {
      // Jika iya, atur nilai maxY ke nilai terbesar newData
      maxY.value =
          newData.reduce((value, element) => value > element ? value : element);
    }
    // Set nilai newData ke mybardata
    mybarData.sunAmmount = newData[0];
    update(); // Memperbarui tampilan
  }

  @override
  void onInit() {
    scrollController.addListener(_scrollListener);
    super.onInit();
    mybarData.initializeBarData();
    dropdownValue.value = "Pemasukan";
    getProfile();
    fetchTransaction();
  }
}
