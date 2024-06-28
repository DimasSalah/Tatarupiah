import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tatarupiah/app/style/colors.dart';
import 'package:tatarupiah/app/style/text_style.dart';
import '../../../../../../style/gradient.dart';
import '../../../controllers/transaction_controller.dart';
import '../SearchField.dart';
import '../card_cashier_mode.dart';
import '../category_list_card.dart';
import '../skeleton_transaction.dart';

class CashierMode extends StatelessWidget {
  const CashierMode({
    super.key,
    required this.controller,
  });

  final TransactionController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                  left: 23,
                  right: 23,
                  top: 12,
                  bottom: 15,
                ),
                child: SearchField(
                  onChanged: (value) => controller.filterCategory(value),
                ),
              ),
              Obx(() {
                return controller.isLoading.value
                    ? const SkeletonTransaction()
                    : controller.filteredCategoryCashierList.isEmpty
                        ? Center(
                            child: Text(
                              'Kategori tidak ditemukan',
                              style: regular.copyWith(fontSize: 14),
                            ),
                          )
                        : Expanded(
                            child: ListView.builder(
                            controller: controller.scrollController,
                            itemCount:
                                controller.filteredCategoryCashierList.length,
                            itemBuilder: (context, index) {
                              final category =
                                  controller.filteredCategoryCashierList[index];
                              return Column(
                                children: [
                                  CategoryListCard(
                                    title: category.nama,
                                  ),
                                  ...category.subCategories
                                      .map(
                                        (subCategory) =>
                                            GetBuilder<TransactionController>(
                                          id: 'order_${subCategory.id}',
                                          builder: (controller) {
                                            return CardCashierMode(
                                              title: subCategory.nama,
                                              price:
                                                  subCategory.nominalPenjualan,
                                              countOrder:
                                                  subCategory.orderCount,
                                              increment: () => controller
                                                  .incrementOrder(subCategory),
                                              decrement: () => controller
                                                  .decrementOrder(subCategory),
                                            );
                                          },
                                        ),
                                      )
                                      .toList(),
                                ],
                              );
                            },
                          ));
              }),
              const Gap(20)
            ],
          ),
          Obx(() {
            return controller.isButtonVisible.value
                ? Positioned(
                    bottom: 35,
                    right: 35,
                    child: GestureDetector(
                      onTap: () {
                        // Tampilkan dialog dengan daftar kategori yang dipilih
                        Get.dialog(
                          AlertDialog(
                            title: const Text('Daftar Transaksi'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (controller.selectedSubCategories.isNotEmpty)
                                  ...controller.selectedSubCategories
                                      .map((subCategory) {
                                    return ListTile(
                                      title: Text(subCategory.nama),
                                      subtitle: Text(
                                          'Jumlah: ${subCategory.orderCount}'),
                                    );
                                  }).toList()
                                else
                                  const Text('Tidak ada item yang dipilih.'),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Text('Batal'),
                              ),
                              TextButton(
                                onPressed: () {
                                  // controller.postTransaction();
                                  Get.back();
                                },
                                child: const Text('Ya'),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            gradient: primary,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: SvgPicture.asset(
                            'assets/icons/plus.svg',
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink();
          }),
        ],
      ),
    );
  }
}
