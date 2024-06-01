import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../../style/colors.dart';
import '../../../../../style/text_style.dart';
import '../../controllers/transaction_controller.dart';
import 'SearchField.dart';
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
            child: const SearchField(),
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

