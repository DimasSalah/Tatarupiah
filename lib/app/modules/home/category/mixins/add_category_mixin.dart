import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

mixin AddCategoryMixin on GetxController {
  RxString iconSelected = ''.obs;
  RxString subCategoryName = ''.obs;
  RxString incomeAmount = '0'.obs;
  RxString expanseAmount = '0'.obs;
  RxString outcomeAmount = '0'.obs;

  void pickIcon(value) {
    iconSelected.value = value;
  }

  void onSubCategory(value) {
    subCategoryName.value = value;
  }

  void setOutcomeAmount(value) {
    outcomeAmount.value = value;
    print(outcomeAmount.value);
  }

  void setIncomeAmount(value) {
    incomeAmount.value = value;
  }

  void setExpanseAmount(value) {
    expanseAmount.value = value;
  }

  void closeAddCategory() {
    iconSelected.value = '';
    incomeAmount.value = '0';
    expanseAmount.value = '0';
    subCategoryName.value = '';
  }
}
