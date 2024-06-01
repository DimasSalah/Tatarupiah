import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tatarupiah/app/modules/home/transaction/views/components/save_button.dart';

import '../../../../../style/colors.dart';
import '../../../../../style/text_style.dart';
import '../../../transaction/views/components/amount_input.dart';
import '../../controllers/category_controller.dart';

class IncomeAddCategoryTab extends StatelessWidget {
  const IncomeAddCategoryTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 23, right: 23, top: 20, bottom: 16),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Get.dialog(
                    AlertDialog(
                      backgroundColor: light,
                      surfaceTintColor: light,
                      scrollable: true,
                      title: Text('Pilih Icon', style: medium.copyWith(fontSize: 22),textAlign: TextAlign.center,),
                      content: SizedBox(
                        width: double.maxFinite,
                        height: Get.height * 0.4,
                        child: PageView.builder(
                            itemCount: (controller.iconPacks.length / 20).ceil(),
                            itemBuilder: (context, pageIndex) {
                              final startIndex = pageIndex * 20;
                              final endIndex = startIndex + 20;
                              final iconsToShow = controller.iconPacks.sublist(
                                startIndex,
                                endIndex > controller.iconPacks.length
                                    ? controller.iconPacks.length
                                    : endIndex,
                              );
                              return GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                ),
                                itemCount: iconsToShow.length,
                                itemBuilder: (context, iconIndex) {
                                  return GestureDetector(
                                    onTap: () {
                                      controller.pickIcon(iconsToShow[iconIndex]);
                                      Get.back();
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(14),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: dark
                                      ),
                                      child: SvgPicture.asset(
                                        iconsToShow[iconIndex],
                                      ),
                                    ),
                                  );
                                },
                              );
                            }),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text('Tutup',style: regular.copyWith(fontSize: 13,color: normal),),
                        ),
                      ],
                    ),
                  );
                },
                child: Container(
                  height: 63,
                  width: 63,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: dark,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: lighter,
                    ),
                  ),
                  child: Obx(
                    () => SvgPicture.asset(
                      controller.iconSelected.value == ''
                          ? 'assets/icons/gallery.svg'
                          : controller.iconSelected.value,
                          width: 35,
                    ),)
                ),
              ),
              const Gap(8),
              Expanded(
                child: TextField(
                  onChanged: controller.onSubCategory,
                  decoration: InputDecoration(
                    hintText: 'Nama Sub Kategori',
                    hintStyle: medium.copyWith(
                      fontSize: 13,
                      color: lightActive,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: lightActive,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: normal,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 8,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        AmountInput(
          label: 'Nominal Penjualan',
          color: success,
          onChanged: (value) => controller.setIncomeAmount(value),
        ),
        const Gap(10),
        AmountInput(
          label: 'Nominal Pengeluaran / Harga Pokok',
          color: error,
          onChanged: (value) => controller.setExpanseAmount(value),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(left: 23, right: 23, bottom: 16),
          child: SaveButton(
            title: 'Simpan',
            onTap: () {
              print('test');
              controller.submitSubCategoty();
            },
          ),
        )
      ],
    );
  }
}
