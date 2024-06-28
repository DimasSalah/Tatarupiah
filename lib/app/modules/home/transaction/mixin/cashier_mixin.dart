import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import '../../category/data/models/category_model.dart';
import '../../category/data/services/category_service.dart';
import '../data/services/transaction_services.dart';

mixin CashierMixin on GetxController {
  RxList<Category> categoryCashierList = <Category>[].obs;
  RxList<Category> filteredCategoryCashierList = <Category>[].obs;
  RxBool isLoading = false.obs;
  RxInt orderValue = 0.obs;
  RxBool isButtonVisible = true.obs;
  final ScrollController scrollController = ScrollController();
  final transactionService = TransactionServices();

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

  Future<void> getCategory() async {
    try {
      isLoading.value = true;
      final categoryService = CategoryService();
      final response = await categoryService.getCategory();
      categoryCashierList.value = response.data
          .where((category) => category.type == "Pemasukan")
          .toList();
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        isButtonVisible.value = false;
      } else if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        isButtonVisible.value = true;
      }
    });
  }

  void filterCategory(String subCategoryName) {
    if (subCategoryName.isEmpty) {
      filteredCategoryCashierList.value = categoryCashierList;
    } else {
      filteredCategoryCashierList.value = categoryCashierList
          .map((category) {
            var filteredSubCategories = category.subCategories
                .where((subCategory) => subCategory.nama
                    .toLowerCase()
                    .contains(subCategoryName.toLowerCase()))
                .toList();
            return Category(
              id: category.id,
              nama: category.nama,
              type: category.type,
              createdAt: category.createdAt,
              updatedAt: category.updatedAt,
              subCategories: filteredSubCategories,
            );
          })
          .where((category) => category.subCategories.isNotEmpty)
          .toList();
    }
    // print("Filtered Categories:");
    // for (var category in filteredCategoryCashierList) {
    //   print("Category: ${category.nama}");
    //   for (var subCategory in category.subCategories) {
    //     print("  SubCategory: ${subCategory.nama}");
    //   }
    // }
  }

  List<SubCategory> get selectedSubCategories {
    List<SubCategory> selected = [];
    for (var category in filteredCategoryCashierList) {
      for (var subCategory in category.subCategories) {
        if (subCategory.orderCount > 0) {
          selected.add(subCategory);
        }
      }
    }
    return selected;
  }

  @override
  void onClose() {
    super.onClose();
  }
}
