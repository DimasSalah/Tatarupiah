import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:tatarupiah/app/utils/date_format.dart';

import '../../../../../style/colors.dart';
import '../../../../../style/text_style.dart';
import '../../controllers/transaction_controller.dart';

class SwitchMode extends StatelessWidget {
  const SwitchMode({
    super.key,
    required this.controller,
  });

  final TransactionController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 23,
        right: 23,
        top: 10,
      ),
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            controller.switchMode.value
                ? Text(
                    'Mode Kasir',
                    style: regular.copyWith(fontSize: 13),
                  )
                : Text(
                    'Mode Normal',
                    style: regular.copyWith(fontSize: 13),
                  ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlutterSwitch(
                  height: 35.0,
                  valueFontSize: 12.0,
                  toggleSize: 25.0,
                  value: controller.switchMode.value,
                  borderRadius: 30.0,
                  padding: 5.0,
                  toggleColor:
                      controller.switchMode.value ? yellowAccent : greenAccent,
                  activeColor: dark,
                  inactiveColor: dark,
                  onToggle: (value) {
                    controller.switchButton(value);
                  },
                ),
                Row(
                  children: [
                    Text(
                      statusDate(DateTime.now()),
                      style: medium.copyWith(fontSize: 13, color: normal),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Icon(
                      Icons.edit,
                      color: lightActive,
                      size: 24,
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
