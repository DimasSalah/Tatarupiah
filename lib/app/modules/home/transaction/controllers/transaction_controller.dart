import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tatarupiah/app/routes/app_pages.dart';
import 'package:tatarupiah/app/utils/currency_format.dart';

import '../../category/views/category_view.dart';

class TransactionController extends GetxController {
  RxBool switchMode = false.obs;
  RxInt selectedIndex = 0.obs;
  RxBool selectedTab = true.obs;
  RxString incomeValue = '0'.obs; //value for incomeValue tab bar
  RxString expenseValue = '0'.obs; //value for incomeValue tab bar
  RxString outcomeValue = '0'.obs; // value for outcomeValue tab bar
  RxInt keuntungan = 0.obs;
  RxString incomeCurentValue = '100'.obs;
  RxString outcomeCurentValue = ''.obs;
  RxInt orderValue = 0.obs;

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
    keuntungan.value = incomeValueValue - outcomeValueValue;
  }

  void incomeAmount(String value) {
    incomeValue.value = value;
  }

  //initial value for textformfield
  // void initialValue(){
  //   incomeCurentValue.value = incomeValue.value;
  //   outcomeCurentValue.value = outcomeValue.value;
  //   outcome1CurentValue.value = outcome.value;
  // }

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

  void incrementOrder() {
    orderValue.value++;
  }

  void decrementOrder() {
    if (orderValue.value > 0) {
      orderValue.value--;
    }
  }

  void navigatedToCategory() async {
    final result = await Get.toNamed(Routes.CATEGORY,
        arguments: {'type': selectedTab.value ? 'Pemasukan' : 'Pengeluaran'});

    if (result != null) {
      incomeValue.value = result['hargaBeli'];
      expenseValue.value = result['hargaJual'];
      print(incomeValue.value);
      print(expenseValue.value);
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
