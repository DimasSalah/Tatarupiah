import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:tatarupiah/app/modules/home/transaction/views/components/SearchField.dart';
import 'package:tatarupiah/app/style/colors.dart';

import '../../../../style/gradient.dart';
import '../../../../style/text_style.dart';
import '../controllers/category_controller.dart';

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
          padding: EdgeInsets.symmetric(horizontal: 23),
          child: Column(
            children: [
              const Gap(8),
              const SearchField(),
              const Gap(16),
              Obx(
                () => GestureDetector(
                  onTap: () {
                    controller.isAddCategory.value =
                        !controller.isAddCategory.value;
                  },
                  child: controller.isAddCategory.value
                      ? Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                gradient: primary,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: SvgPicture.asset(
                                'assets/icons/add.svg',
                                width: 14,
                              ),
                            ),
                            const Gap(20),
                            Text(
                              'Tambah Kategori',
                              style: regular.copyWith(
                                fontSize: 16,
                                color: dark,
                              ),
                            ),
                          ],
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: TextField(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Makanan',
                    style: regular.copyWith(fontSize: 16, color: lightActive),
                  ),
                  GestureDetector(
                    onTap: controller.navigatedToAddCategory,
                    child: SvgPicture.asset(
                      'assets/icons/add.svg',
                      width: 15,
                    ),
                  ),
                ],
              ),
              const Gap(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      color: dark,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Icon(
                      Icons.drive_eta_outlined,
                      color: light,
                    ),
                  ),
                  const Gap(20),
                  Expanded(
                    child: Text(
                      'Transportasi',
                      style: regular.copyWith(fontSize: 14, color: dark),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(
                      'assets/icons/delete.svg',
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
