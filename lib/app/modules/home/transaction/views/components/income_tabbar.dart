import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tatarupiah/app/modules/home/transaction/views/components/amount_input.dart';
import 'package:tatarupiah/app/modules/home/transaction/views/components/card_cashier_mode.dart';
import 'package:tatarupiah/app/modules/home/transaction/views/components/switch_mode.dart';

import '../../../../../style/colors.dart';
import '../../../../../style/text_style.dart';
import '../../../../../utils/currency_format.dart';
import '../../controllers/transaction_controller.dart';
import 'payment_dropdown.dart';

class IncomeTabBar extends StatelessWidget {
  const IncomeTabBar({
    super.key,
    required this.controller,
  });

  final TransactionController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          SwitchMode(controller: controller),
          controller.switchMode.value
              //mode kasir
              ? Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        left: 23,
                        right: 23,
                        top: 10,
                        bottom: 15,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: SvgPicture.asset(
                            'assets/icons/search.svg',
                          ),
                          prefixIconConstraints: const BoxConstraints(
                            minWidth: 52,
                          ),
                          hintText: 'Cari Produk',
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
                            vertical: 8,
                            horizontal: 8,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 23,
                        vertical: 10,
                      ),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.symmetric(
                          horizontal: BorderSide(
                            color: lightActive,
                            width: 1,
                          ),
                        ),
                      ),
                      child: Text(
                        'Makanan',
                        style: regular.copyWith(
                          fontSize: 16,
                          color: lightActive,
                        ),
                      ),
                    ),
                    const Gap(10),
                    Obx(
                      () => CardCashierMode(
                        title: 'Nasi Goreng',
                        price: 27000,
                        countOrder: controller.orderValue.value,
                        increment: controller.incrementOrder,
                        decrement: controller.decrementOrder,
                      ),
                    )
                  ],
                )
                //mode normal
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 23, right: 23, top: 10, bottom: 14),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                color: light.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: lightActive),
                              ),
                              child: Text(
                                'Pilihan Kategori',
                                style: regular.copyWith(
                                    fontSize: 13, color: lightActive),
                              ),
                            ),
                          ),
                          const Gap(10),
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: 'Catatan',
                                hintStyle:
                                    regular.copyWith(fontSize: 13, color: dark),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: lightActive),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: dark),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 8),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    AmountInput(
                      label: 'Nominal Penjualan',
                      color: success,
                      onChanged: controller.incomeAmount,
                    ),
                    const Gap(10),
                    AmountInput(
                      label: 'Nominal Pengeluaran / Harga Pokok',
                      color: error,
                      onChanged: controller.outcomeAmount,
                    ),
                    Obx(
                      () => Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 23, vertical: 4),
                        width: double.infinity,
                        color: const Color(0xFF84F269).withOpacity(0.35),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Keuntungan',
                              style:
                                  medium.copyWith(fontSize: 13, color: success),
                            ),
                            Text(
                              currencyViewFormatter(
                                  controller.keuntungan.value.toString()),
                              style: semiBold.copyWith(
                                  fontSize: 13, color: success),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 23),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PaymentDropdown(),
                        ],
                      ),
                    ),
                    const Gap(50),
                    
                  ],
                )
        ],
      ),
    );
  }
}
