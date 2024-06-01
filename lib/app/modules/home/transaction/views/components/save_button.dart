import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../style/colors.dart';
import '../../../../../style/text_style.dart';

class SaveButton extends StatelessWidget {
  final String title;
  final Function()? onTap;

  const SaveButton({
    super.key,
    required this.title,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 24),
        width: Get.width,
        decoration: BoxDecoration(
          color: dark,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          title,
          style: medium.copyWith(
            fontSize: 16,
            color: white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
