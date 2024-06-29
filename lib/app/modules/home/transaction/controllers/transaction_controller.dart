import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:tatarupiah/app/routes/app_pages.dart';
import 'package:tatarupiah/app/utils/currency_format.dart';

import '../data/models/transaction_request.dart';
import '../data/services/transaction_services.dart';
import '../mixin/cashier_mixin.dart';

class TransactionController extends GetxController with CashierMixin {
  RxBool switchMode = false.obs;
  RxInt selectedIndex = 0.obs;
  RxBool selectedTab = true.obs;
  RxString incomeValue = '0'.obs; //value for incomeValue tab bar
  RxString expenseValue = '0'.obs; //value for incomeValue tab bar
  RxString outcomeValue = '0'.obs; // value for outcomeValue tab bar
  RxInt profit = 0.obs;
  Rx<DateTime> date = DateTime.now().obs; //calendar date
  RxString subCategoryName = ''.obs;
  RxInt subCategoryId = 0.obs;
  RxString payment = 'Tunai'.obs;
  RxString note = ''.obs;

  late TextEditingController incomeController;
  late TextEditingController expenseController;
  late TextEditingController outcomeController;
  TextEditingController noteController = TextEditingController();

  void calculateProfit() {
    int incomeValueValue = incomeValue.value.isEmpty
        ? 0
        : int.parse(incomeValue.value.replaceAll('.', ''));
    int outcomeValueValue = expenseValue.value.isEmpty
        ? 0
        : int.parse(expenseValue.value.replaceAll('.', ''));
    profit.value = incomeValueValue - outcomeValueValue;
  }

  void incomeAmount(String value) {
    incomeValue.value = value;
  }

  void expenseAmount(String value) {
    expenseValue.value = value;
  }

  void outcomeAmount(String value) {
    outcomeValue.value = value;
  }

  //function to change main tab bar index incomeValue/outcomeValue
  void changeTabIndex(int index) {
    selectedIndex.value = index;
    incomeValue.value = '0';
    expenseValue.value = '0';
    outcomeValue.value = '0';
    subCategoryId.value = 0;
    subCategoryName.value = '';
    noteController.clear();
  }

  void switchButton(bool value) async {
    //function to switch button kasir/normal mode
    switchMode.value = value;
    noteController.clear();
    switchMode.value ? await getCategory() : categoryCashierList.clear();

    switchMode.value ? filterCategory("") : null;
  }

  void selectedDate(DateTime value) {
    date.value = value;
  }

  void selectedPayment(dynamic value) {
    payment.value = value;
  }

  void navigatedToCategory() async {
    final result = await Get.toNamed(Routes.CATEGORY, arguments: {
      'type': selectedIndex.value == 0 ? 'Pemasukan' : 'Pengeluaran'
    });
    if (result != null) {
      subCategoryId.value = result['idSubKategori'];

      subCategoryName.value = result['namaSubKategori'];
      incomeValue.value = result['hargaBeli'];
      selectedIndex.value == 0 //jika tab bar pengeluaran maka expenseValue 0
          ? expenseValue.value = result['hargaBeli']
          : expenseValue.value = '0';
      selectedIndex.value ==
              0 //fungsi untuk mengisi expanse atau outcome terganung dari tab bar
          ? expenseValue.value = result['hargaJual']
          : outcomeValue.value = result['hargaJual'];
    }
  }

  Future<void> submitTransaction() async {
    try {
      isLoading.value = true;
      final transactionServices = TransactionServices();
      await transactionServices.postTransaction(
        DateFormat('yyyy-MM-dd').format(date.value),
        selectedIndex.value == 0 ? 'Pemasukan' : 'Pengeluaran',
        noteController.text,
        subCategoryId.value,
        int.parse(incomeValue.value.replaceAll('.', '')),
        selectedIndex.value == 0
            ? int.parse(expenseValue.value.replaceAll('.', ''))
            : int.parse(outcomeValue.value.replaceAll('.', '')),
        payment.value,
      );
    } catch (e) {
      Get.snackbar('Error', 'Gagal menambahkan transaksi',
          backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }

  void postTransaction() async {
    // Prepare data from categories/subcategories
    List<TransactionItem> items = [];
    for (var category in categoryCashierList) {
      for (var subCategory in category.subCategories) {
        if (subCategory.orderCount > 0) {
          items.add(TransactionItem(
            nominalPenjualan:
                int.parse(subCategory.nominalPenjualan.replaceAll('.', '')),
            qty: subCategory.orderCount,
            subKategoriId: subCategory.id,
          ));
        }
      }
    }
    try {
      // await transactionService.postTransactionCashier(
      //   TransactionRequest(
      //     tanggal: DateFormat('yyyy-MM-dd').format(date.value),
      //     pembayaran: paymentMethod(),
      //     catatan: noteController.text,
      //     items: items,
      //   ),
      // );
      Get.back();
      Get.dialog(
        AlertDialog(
          content: Lottie.asset(
            'assets/animations/Animation - 1719666456953.json',
            onLoaded: (composition) {
              Future.delayed(composition.duration, () {
                Get.offAllNamed(Routes.MAIN);
              });
            },
          ),
        ),
      );
    } catch (e) {
      Get.snackbar('Gagal', e.toString());
    }
  }

  @override
  void onInit() {
    super.onInit();
    incomeValue.listen((_) => calculateProfit());
    expenseValue.listen((_) => calculateProfit());

    incomeController = TextEditingController(
        text: currencyWithoutSymbol(incomeValue.value.toString()));
    expenseController = TextEditingController(
        text: currencyWithoutSymbol(expenseValue.value.toString()));
    outcomeController = TextEditingController(
        text: currencyWithoutSymbol(outcomeValue.value.toString()));

    incomeValue.listen((value) {
      incomeController.text = currencyWithoutSymbol(value.toString());
    });

    expenseValue.listen((value) {
      expenseController.text = currencyWithoutSymbol(value.toString());
    });

    outcomeValue.listen((value) {
      outcomeController.text = currencyWithoutSymbol(value.toString());
    });
  }
}
