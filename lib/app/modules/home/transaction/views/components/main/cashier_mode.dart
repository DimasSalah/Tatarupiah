import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tatarupiah/app/style/colors.dart';
import 'package:tatarupiah/app/style/text_style.dart';
import '../../../../../../style/gradient.dart';
import '../../../../../../utils/currency_format.dart';
import '../../../controllers/transaction_controller.dart';
import '../SearchField.dart';
import '../card_cashier_mode.dart';
import '../category_list_card.dart';
import '../payment_option.dart';
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
                                              icon: subCategory.icon,
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
                        Get.bottomSheet(
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(25)),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Total',
                                      style: medium.copyWith(fontSize: 20)),
                                  Text(
                                    currencyViewFormatter(
                                        '${controller.getTotalPrice()}'),
                                    style: semiBold.copyWith(fontSize: 25),
                                  ),
                                  const SizedBox(height: 12),
                                  if (controller
                                      .selectedSubCategories.isNotEmpty)
                                    Column(
                                      children: controller.selectedSubCategories
                                          .map((subCategory) {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 6),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 2,
                                                child: Text(subCategory.nama,
                                                    style: regular.copyWith(
                                                        fontSize: 16)),
                                              ),
                                              const SizedBox(width: 10),
                                              Text(
                                                '× ${subCategory.orderCount}',
                                                style: regular.copyWith(
                                                    fontSize: 16),
                                              ),
                                              const Spacer(),
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                  currencyViewFormatter(
                                                      '${int.parse(subCategory.nominalPenjualan) * subCategory.orderCount}'),
                                                  style: semiBold.copyWith(
                                                      fontSize: 16),
                                                  textAlign: TextAlign.right,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                    )
                                  else
                                    Text(
                                      'Tidak ada item yang dipilih.',
                                      style: regular.copyWith(fontSize: 16),
                                    ),
                                  const Gap(20),
                                  Divider(
                                    color: normal,
                                    thickness: 2,
                                  ),
                                  const Gap(10),
                                  TextFormField(
                                    controller: controller.noteController,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      hintText: 'Catatan',
                                      filled: true,
                                      fillColor: light,
                                      hintStyle: regular.copyWith(
                                          fontSize: 13, color: dark),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: lightActive),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: dark),
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 8),
                                    ),
                                  ),
                                  const Gap(14),
                                  Obx(() {
                                    return PaymentOption(
                                      selectedIndex:
                                          controller.selectPayment.value,
                                      onTap: (index) {
                                        controller.paymentIndex(index);
                                      },
                                    );
                                  }),
                                  Gap(20),
                                  GestureDetector(
                                    onTap: () {
                                      if (controller
                                          .selectedSubCategories.isNotEmpty) {
                                        controller.postTransaction();
                                      } else {
                                        null;
                                      }
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 9),
                                      decoration: BoxDecoration(
                                        color: controller.selectedSubCategories
                                                .isNotEmpty
                                            ? dark
                                            : lightActive,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      width: double.infinity,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const SizedBox(width: 5),
                                          Text(
                                            'Tambah Transaksi',
                                            style: regular.copyWith(
                                                fontSize: 16, color: light),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(14),
                                            decoration: BoxDecoration(
                                              gradient: primary,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: SvgPicture.asset(
                                              'assets/icons/left_arrow.svg',
                                              height: 20,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          isScrollControlled: true,
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 12, bottom: 6, top: 6, right: 6),
                        decoration: BoxDecoration(
                          color: dark,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Tambah',
                              style:
                                  regular.copyWith(fontSize: 16, color: white),
                            ),
                            const Gap(10),
                            Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                gradient: primary,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: SvgPicture.asset(
                                'assets/icons/plus.svg',
                              ),
                            )
                          ],
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
