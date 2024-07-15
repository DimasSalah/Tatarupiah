import 'package:get/get.dart';
import 'package:tatarupiah/app/modules/home/category/mixins/icon_mixin.dart';
import 'package:tatarupiah/app/modules/home/category/views/component/custom_dialog_single.dart';
import 'package:tatarupiah/app/routes/app_pages.dart';
import '../data/models/category_model.dart';
import '../data/services/category_service.dart';
import '../data/services/subcategory_service.dart';
import '../mixins/add_category_mixin.dart';
import '../mixins/category_data_mixin.dart';

class CategoryController extends GetxController
    with IconMixin, AddCategoryMixin, CategoryData {
  //for category
  RxBool isAddCategory = true.obs;
  RxInt categoryId = 0.obs;
  RxInt subCategoryId = 0.obs;
  RxString categoryName = ''.obs;

  void newCategory(value) {
    categoryValue.value = value;
  }

  void navigatedToAddCategory() {
    Get.toNamed(Routes.ADDCATEGORY);
  }

  void incrementOrder(SubCategory subCategory) {
    subCategory.orderCount++;
    update([
      'order_${subCategory.id}'
    ]); // Memanggil update untuk memberitahu GetX bahwa ada perubahan pada subCategory tertentu
  }

  void decrementOrder(SubCategory subCategory) {
    if (subCategory.orderCount > 0) {
      subCategory.orderCount--;
      update([
        'order_${subCategory.id}'
      ]); // Memanggil update untuk memberitahu GetX bahwa ada perubahan pada subCategory tertentu
    }
  }

  Future<void> addNewCategory() async {
    final categoryService = CategoryService();
    await categoryService.postCategory(categoryValue.value, categoryType.value);
    getCategory();
    update(['category']);
  }

  void deleteCategory(int id) async {
    final categoryService = CategoryService();
    await categoryService.deleteCategory(id);
    getCategory();
    update(['category']);
  }

  void deleteSubCategory(int id) async {
    final subCategoryService = SubCategoryService();
    await subCategoryService.deleteSubCategory(id);
    getCategory();
    update(['category']);
  }

  void submitSubCategory() {
    // for income sub category
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
      int parseAmount(String amount) {
        String sanitizedAmount = amount.replaceAll('.', '').trim();
        if (sanitizedAmount.isEmpty ||
            !RegExp(r'^\d+$').hasMatch(sanitizedAmount)) {
          return 0; // Default to 0 if the amount is not a valid integer string
        }
        return int.parse(sanitizedAmount);
      }

      subCategoryService.postSubCategory(
        categoryId: categoryId.value,
        type: categoryType.value,
        name: subCategoryName.value,
        icon: iconSelected.value,
        income: parseAmount(incomeAmount.value),
        expanse: categoryType.value == "Pemasukan"
            ? int.parse(expanseAmount.value.replaceAll('.', ''))
            : int.parse(outcomeAmount.value
                .replaceAll('.', '')), // ganti jika expanse tabbar value
      );
      Future.delayed(const Duration(milliseconds: 1500), () {
        getCategory();
        update(['category']);
      });
      closeAddCategory();
    }
  }

  @override
  void onInit() async {
    final arguments = Get.arguments as Map<String, dynamic>;
    categoryType.value = arguments['type'];
    print(categoryType.value);
    await getCategory();
    super.onInit();
  }
}
