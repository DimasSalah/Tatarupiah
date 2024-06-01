import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tatarupiah/app/modules/home/transaction/views/components/switch_mode.dart';

import '../../controllers/transaction_controller.dart';
import 'cashier_mode.dart';
import 'normal_mode.dart';
import 'save_button.dart';

class IncomeTabBar extends StatelessWidget {
  const IncomeTabBar({
    super.key,
    required this.controller,
  });

  final TransactionController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Column(
            children: [
              SwitchMode(controller: controller),
              controller.switchMode.value
                  //mode kasir
                  ? CashierMode(controller: controller)
                  //mode normal
                  : NormalMode(controller: controller)
            ],
          ),
          const Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 23),
              child: SaveButton(
                title: 'Simpan Transaksi',
              ),
            ),
          )
        ],
      ),
    );
  }
}

