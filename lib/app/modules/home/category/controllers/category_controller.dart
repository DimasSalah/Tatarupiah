import 'package:get/get.dart';
import 'package:tatarupiah/app/routes/app_pages.dart';

class CategoryController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxBool isAddCategory = true.obs;

  

  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }

  void navigatedToAddCategory() {
    Get.toNamed(Routes.ADDCATEGORY);
    print('navigated to add category');
  }



}
