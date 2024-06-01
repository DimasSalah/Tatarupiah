import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

mixin AddCategoryMixin on GetxController {
  RxString iconSelected = ''.obs;
  RxString subCategoryName = ''.obs;
  RxString incomeAmount = ''.obs;
  RxString expanseAmount = ''.obs;

  void pickIcon(value) {
    iconSelected.value = value;
  }

  void onSubCategory(value) {
    subCategoryName.value = value;
  }

  void setIncomeAmount(value) {
    incomeAmount.value = value;
  }

  void setExpanseAmount(value) {
    expanseAmount.value = value;
  }

  

  void closeAddCategory() {
    iconSelected.value = '';
    incomeAmount.value = '';
    expanseAmount.value = '';
    subCategoryName.value = '';
  }
}