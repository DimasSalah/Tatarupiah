import 'package:get/get.dart';
import 'package:tatarupiah/app/data/models/category_model.dart';
import 'package:tatarupiah/app/modules/home/category/mixins/icon_mixin.dart';
import 'package:tatarupiah/app/routes/app_pages.dart';

import '../../../../data/api/category_service.dart';
import '../../../../data/api/subcategory_service.dart';
import '../mixins/add_category_mixin.dart';

class CategoryController extends GetxController with IconMixin, AddCategoryMixin {
  //for category
  RxBool isAddCategory = true.obs;
  RxString categoryType = ''.obs;
  RxString categoryValue = ''.obs;
  RxInt categoryId = 0.obs;
  RxInt subCategoryId = 0.obs;
  RxString categoryName = ''.obs;
  RxList<Category> categoryList = <Category>[].obs;

  void newCategory(value) {
    categoryValue.value = value;
  }

  void navigatedToAddCategory() {
    Get.toNamed(Routes.ADDCATEGORY);
  }

  void deleteCategory(int id) async {
    final categoryService = CategoryService();
    await categoryService.deleteCategory(id);
    update(['category']);
  }

  void deleteSubCategory(int id) async {
    final subCategoryService = SubCategoryService();
    await subCategoryService.deleteSubCategory(id);
    update(['category']);
  }

  Future<void> addNewCategory() async {
    final categoryService = CategoryService();
    await categoryService.postCategory(categoryValue.value, categoryType.value);
    update(['category']);
  }

  Future<void> getAllCategory() async {
    final categoryService = CategoryService();
    await categoryService.getCategory();
  }

  void submitSubCategoty() {
    print(categoryId.value);
    print(categoryType.value);
    print(subCategoryName.value);
    print(iconSelected.value);
    print(incomeAmount.value.replaceAll('.', ''));
    print(expanseAmount.value.replaceAll('.', ''));
  }

  @override
  void onInit() {
    final arguments = Get.arguments as Map<String, dynamic>;
    categoryType.value = arguments['type'];
    super.onInit();
  }

}
