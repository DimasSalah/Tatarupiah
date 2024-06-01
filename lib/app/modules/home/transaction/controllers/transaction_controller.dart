import 'package:get/get.dart';
import 'package:tatarupiah/app/routes/app_pages.dart';

class TransactionController extends GetxController {
  RxBool switchMode = false.obs;
  RxInt selectedIndex = 0.obs;
  RxBool selectedTab = true.obs;
  RxString incomeValue = '0'.obs; //value for incomeValue tab bar
  RxString outcomeValue = '0'.obs; //value for outcomeValue tab bar
  RxString expense = '0'.obs; // value for outcomeValue tab bar
  RxInt keuntungan = 0.obs;
  RxString incomeCurentValue = '100'.obs;
  RxString outcomeCurentValue = ''.obs;
  RxString outcome1CurentValue = ''.obs;
  RxInt orderValue = 0.obs;

 
  void calculateProfit() {
    int incomeValueValue = incomeValue.value.isEmpty ? 0 : int.parse(incomeValue.value.replaceAll('.', ''));
    int outcomeValueValue = outcomeValue.value.isEmpty ? 0 : int.parse(outcomeValue.value.replaceAll('.', ''));
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

  void outcomeAmount(String value) {
    outcomeValue.value = value;
  }

  void expenseAmount(String value) {
    expense.value = value;
  }

  //function to change main tab bar index incomeValue/outcomeValue
  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }

  void switchButton(bool value) { //function to switch button kasir/normal mode
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

  void navigatedAToCategory() {
    Get.toNamed(Routes.CATEGORY, arguments: {'type': selectedTab.value ? 'Pemasukan' : 'Pengeluaran'});
  }

  @override
  void onInit() {
    super.onInit();
    incomeValue.listen((_) => calculateProfit());
    outcomeValue.listen((_) => calculateProfit());
    // incomeValue.listen((_) => initialValue());
    // outcomeValue.listen((_) => initialValue());
    // outcome.listen((_) => initialValue());

  }
}
