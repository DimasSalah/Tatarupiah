import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tatarupiah/app/modules/home/category/data/services/category_service.dart';
import 'package:tatarupiah/app/modules/home/category/data/models/category_model.dart';
import 'package:tatarupiah/app/modules/home/category/views/component/custom_dialog.dart';
import 'package:tatarupiah/app/modules/home/transaction/views/components/SearchField.dart';
import 'package:tatarupiah/app/style/colors.dart';
import '../../../../style/text_style.dart';
import '../controllers/category_controller.dart';
import 'component/adding_category.dart';
import 'component/name_category.dart';
import 'component/skeleton_category.dart';
import 'component/subcategory_card.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/arrow_left.svg',
            width: 12,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'Kategori',
          style: semiBold.copyWith(fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23),
          child: Column(
            children: [
              const Gap(8),
              const SearchField(),
              const Gap(16),
              //add category
              Obx(
                () => GestureDetector(
                  onTap: () {
                    controller.isAddCategory.value =
                        !controller.isAddCategory.value;
                  },
                  child: controller.isAddCategory.value
                      ? const AddingCategory()
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: TextField(
                                onChanged: controller.newCategory,
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: dark,
                                    ),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: lightActive,
                                    ),
                                  ),
                                  hintText: 'Nama Kategori',
                                  hintStyle: regular.copyWith(
                                    fontSize: 14,
                                    color: lightActive,
                                  ),
                                ),
                              ),
                            ),
                            const Gap(10),
                            GestureDetector(
                              onTap: () {
                                controller.isAddCategory.value =
                                    !controller.isAddCategory.value;
                              },
                              child: Text(
                                'Batal',
                                style: regular.copyWith(
                                  fontSize: 13,
                                  color: error,
                                ),
                              ),
                            ),
                            const Gap(10),
                            GestureDetector(
                              onTap: () {
                                controller.addNewCategory();
                                controller.isAddCategory.value =
                                    !controller.isAddCategory.value;
                              },
                              child: Text(
                                'Tambah',
                                style: regular.copyWith(
                                  fontSize: 13,
                                  color: success,
                                ),
                              ),
                            )
                          ],
                        ),
                ),
              ),
              const Gap(20),
              Obx(
                () => controller.isLoading.value
                    ? const SkeletonCategory()
                    : GetBuilder<CategoryController>(
                        init: CategoryController(),
                        id: 'category',
                        builder: (controller) {
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.categoryList.length,
                            itemBuilder: (context, index) {
                              final category = controller.categoryList[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Dismissible(
                                  confirmDismiss: (direction) async {
                                    if (direction ==
                                        DismissDirection.endToStart) {
                                      Get.dialog(
                                        CustomDialog(
                                          title: 'Hapus Kategori',
                                          content:
                                              'Apakah anda yakin ingin menghapus kategori ini?',
                                          onConfirm: () {
                                            controller
                                                .deleteCategory(category.id);
                                            Get.back();
                                          },
                                        ),
                                      );
                                    }
                                    return null;
                                  },
                                  background: Container(
                                    padding: const EdgeInsets.only(left: 20),
                                    alignment: Alignment.centerLeft,
                                    decoration: BoxDecoration(
                                        color: error.withOpacity(0.3),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Icon(
                                      Icons.delete,
                                      color: error,
                                      size: 30,
                                    ),
                                  ),
                                  key: ValueKey(category),
                                  child: Column(
                                    children: [
                                      NameCategory(
                                        name: category.nama,
                                        onTap: () {
                                          controller.categoryId.value =
                                              category.id;
                                          controller.navigatedToAddCategory();
                                        },
                                      ),
                                      const Gap(8),
                                      ...category.subCategories
                                          .map(
                                            (subCategory) => SubCategoryCard(
                                              subName: subCategory.nama,
                                              icon: subCategory.icon,
                                              onTap: () {
                                                Get.back(result: {
                                                  'idSubKategori':
                                                      subCategory.id,
                                                  'namaSubKategori':
                                                      subCategory.nama,
                                                  'hargaBeli': subCategory
                                                      .nominalPenjualan,
                                                  'hargaJual': subCategory
                                                      .nominalPengeluaran,
                                                });
                                                print(subCategory
                                                    .nominalPengeluaran);
                                              },
                                              onDelete: () {
                                                controller.deleteSubCategory(
                                                    subCategory.id);
                                                Get.snackbar('Sub Kategori',
                                                    'Berhasil menghapus sub kategori');
                                              },
                                            ),
                                          )
                                          .toList(),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
