import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tatarupiah/app/routes/app_pages.dart';
import 'package:tatarupiah/app/utils/currency_format.dart';

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

  late TextEditingController incomeController;
  late TextEditingController expenseController;
  late TextEditingController outcomeController;

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
  }

  void switchButton(bool value) {
    //function to switch button kasir/normal mode
    switchMode.value = value;
  }

  void selectedDate(DateTime value) {
    date.value = value;
  }

  void navigatedToCategory() async {
    final result = await Get.toNamed(Routes.CATEGORY, arguments: {
      'type': selectedIndex.value == 0 ? 'Pemasukan' : 'Pengeluaran'
    });
    if (result != null) {
      print('id sub kategori: ${result['idSubKategori']}');
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

    // incomeValue.listen((_) => initialValue());
    // outcomeValue.listen((_) => initialValue());
    // outcome.listen((_) => initialValue());
  }
}
