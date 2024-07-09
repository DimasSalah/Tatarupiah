import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../../style/colors.dart';
import '../../../../../style/text_style.dart';

class CustomDialogSingle extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onConfirm;

  const CustomDialogSingle({
    super.key,
    required this.title,
    required this.content,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: light,
      surfaceTintColor: Colors.transparent,
      title: Text(
      title,
        textAlign: TextAlign.center,
        style: semiBold.copyWith(fontSize: 22),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            content,
            style: regular.copyWith(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const Gap(20),
          GestureDetector(
            onTap: onConfirm,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(
                color: dark,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Oke',
                style: medium.copyWith(fontSize: 13, color: lighter),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
