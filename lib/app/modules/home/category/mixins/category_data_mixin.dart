import 'package:get/get.dart';

import '../data/models/category_model.dart';
import '../data/services/category_service.dart';
import '../data/services/subcategory_service.dart';

mixin CategoryData on GetxController {
  RxList<Category> categoryList = <Category>[].obs;
  RxString categoryType = ''.obs;
  RxString categoryValue = ''.obs;
  RxBool isLoading = false.obs;

  Future<void> getCategory() async {
    try {
      isLoading.value = true;
      final categoryService = CategoryService();
      final response = await categoryService.getCategory();
      categoryList.value = response.data
          .where((category) => category.type == categoryType.value)
          .toList();
    } finally {
      isLoading.value = false;
      update(['category']);
    }
  }

  @override
  void onClose() {
    void filterPlayer(String categoryName) {
      categoryList.value = categoryList.value
          .where((category) => category.nama == categoryName)
          .toList();
    }
    super.onClose();
  }
}
