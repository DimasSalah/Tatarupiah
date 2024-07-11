import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:tatarupiah/app/modules/home/data/services/transaction_service.dart';

import '../../data/models/transaction_model.dart';

class HistoryController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isFetchingMore = false.obs;
  RxBool hasMoreData = true.obs;
  RxList<TransactionHistory> transactionsList = <TransactionHistory>[].obs;
  RxInt currentPage = 1.obs;
  RxString rangeStartDate = ''.obs;
  RxString rangeEndDate = ''.obs;
  var transactionsByDate = <String, List<TransactionHistory>>{}.obs;
  var groupedTransactions = <DateTime, List<TransactionHistory>>{}.obs;
  var startDate = Rxn<DateTime>();
  var endDate = Rxn<DateTime>();
  var maxDate = Rxn<DateTime>();

  final ScrollController scrollController = ScrollController();
  final TransactionService transactionService = TransactionService();

  Future<void> delTransaction(int id) async {
    try {
      await transactionService.deleteTransaction(id);
      transactionsList.removeWhere((element) => element.id == id);
      groupTransactionsByDate();
      update(['history']);
    } catch (e) {
      Get.snackbar("Error", 'Gagal menghapus transaksi');
    }
  }

  Future<void> fetchTransaction(String start, String end) async {
    print('start date: $start end date: $end');
    final transactionService = TransactionService();
    try {
      isLoading.value = true;
      final transaction = await transactionService.getTransaction(
        startDate: start,
        endDate: end,
        page: currentPage.value,
      );
      if (transaction.data.data.isNotEmpty) {
        transactionsList.addAll(transaction.data.data);
        groupTransactionsByDate();
        if (transaction.data.data.length < 15) {
          // Adjust according to your pagination size
          hasMoreData.value = false;
        }
      } else {
        hasMoreData.value = false;
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchMoreTransactions() async {
    String startDateInitial = DateFormat('yyyy-MM-dd')
        .format(DateTime.now().subtract(const Duration(days: 2)));
    String endDateInitial = DateFormat('yyyy-MM-dd').format(DateTime.now());
    print(
        'fetch more start date: ${startDate.value} end date: ${endDate.value}');
    final transactionService = TransactionService();
    try {
      isFetchingMore.value = true;
      var response = await transactionService.getTransaction(
        startDate: startDate.value?.toString() ?? startDateInitial,
        endDate: endDate.value?.toString() ?? endDateInitial,
        page: currentPage.value,
      );
      if (response.data.data.isNotEmpty) {
        transactionsList.addAll(response.data.data);
        groupTransactionsByDate();
        currentPage.value++;
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
    if (scrollController.position.maxScrollExtent ==
        scrollController.position.pixels) {
      print('fetch more');
      fetchMoreTransactions();
    }
  }

  void groupTransactionsByDate() {
    groupedTransactions.clear();
    for (var transaction in transactionsList) {
      final date = transaction.tanggal;
      if (!groupedTransactions.containsKey(date)) {
        groupedTransactions[date] = [];
      }
      groupedTransactions[date]!.add(transaction);
    }
    update(['history']); // Ensure the view is updated after grouping
  }

  @override
  void onInit() {
    scrollController.addListener(_scrollListener);
    fetchTransaction(
      DateFormat('yyyy-MM-dd')
          .format(DateTime.now().subtract(const Duration(days: 2))),
      DateFormat('yyyy-MM-dd').format(DateTime.now()),
    );
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.onClose();
  }

  void onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {
      startDate.value = (args.value as PickerDateRange).startDate;
      endDate.value = (args.value as PickerDateRange).endDate;
      maxDate.value = startDate.value!.add(const Duration(days: 7));
    }
  }

  void resetSelection() {
    startDate.value = null;
    endDate.value = null;
    maxDate.value = null;
  }
}
