import 'package:get/get.dart';
import 'package:tatarupiah/app/data/models/category_model.dart';
import 'package:tatarupiah/app/modules/home/category/mixins/icon_mixin.dart';
import 'package:tatarupiah/app/modules/home/category/views/component/custom_dialog_single.dart';
import 'package:tatarupiah/app/routes/app_pages.dart';
import '../../../../data/api/category_service.dart';
import '../../../../data/api/subcategory_service.dart';
import '../mixins/add_category_mixin.dart';

class CategoryController extends GetxController
    with IconMixin, AddCategoryMixin {
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

  void resultfromAddCategory() async {
    await Get.to(Routes.ADDCATEGORY, arguments: {'type': categoryType.value});
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

  void submitSubCategory() { //for income sub category
  print(categoryId.value);
  print(categoryType.value);
  print(iconSelected.value);
  print(subCategoryName.value);
  print(incomeAmount.value);
  print(expanseAmount.value);
  print(outcomeAmount.value);
    if (iconSelected.value.isEmpty || subCategoryName.value.isEmpty) {
      Get.dialog(
        CustomDialogSingle(
          title: 'Gagal',
          content: 'icon dan nama sub kategori tidak boleh kosong',
          onConfirm: () {
            Get.back();
          },
        ),
      );
    } else {
      final subCategoryService = SubCategoryService();
      subCategoryService.postSubCategory(
        categoryId: categoryId.value,
        type: categoryType.value,
        name: subCategoryName.value,
        icon: iconSelected.value,
        income: int.parse(incomeAmount.value.replaceAll('.', '')),
        expanse: int.parse(expanseAmount.value.replaceAll('.', '')), // ganti jika expanse tabbar value
      );
      Future.delayed(const Duration(milliseconds: 1500), () {
        update(['category']);
      });
      closeAddCategory();
    }
  }

  @override
  void onInit() {
    final arguments = Get.arguments as Map<String, dynamic>;
    categoryType.value = arguments['type'];
    super.onInit();
  }
}
