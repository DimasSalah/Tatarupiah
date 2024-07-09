import 'package:flutter/material.dart';
import 'package:tatarupiah/app/style/colors.dart';
import 'package:tatarupiah/app/style/text_style.dart';

class CustomTextContainer extends StatelessWidget {
  final String text;
  final double height;
  final TextStyle? textStyle;
  final Color? backgroundColor;

  const CustomTextContainer({
    Key? key,
    required this.text,
    this.height = 38,
    this.textStyle,
    this.backgroundColor, // Tidak perlu memberikan nilai default
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor ??
            light, // Gunakan backgroundColor yang ditentukan atau light sebagai default
        borderRadius: BorderRadius.circular(17),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          text,
          style:
              textStyle ?? regular.copyWith(fontSize: 13, color: lightActive),
        ),
      ),
    );
  }
}
