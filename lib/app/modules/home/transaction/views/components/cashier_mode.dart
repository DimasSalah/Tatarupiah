import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../../style/colors.dart';
import '../../../../../style/text_style.dart';
import '../../controllers/transaction_controller.dart';
import 'card_cashier_mode.dart';
class CashierMode extends StatelessWidget {
  const CashierMode({
    super.key,
    required this.controller,
  });

  final TransactionController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
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
      );
  }
}