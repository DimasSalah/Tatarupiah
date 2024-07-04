import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tatarupiah/app/modules/home/transaction/views/components/switch_mode.dart';

import '../../../controllers/transaction_controller.dart';
import 'cashier_mode.dart';
import 'normal_mode.dart';
import '../save_button.dart';

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
              ? CashierMode(controller: controller)
              //mode normal
              : NormalMode(controller: controller)
        ],
      ),
    );
  }
}
