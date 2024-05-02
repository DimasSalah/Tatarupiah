import 'package:flutter/material.dart';
import 'package:tatarupiah/app/style/colors.dart';
import 'package:tatarupiah/app/style/text_style.dart';

class CustomTextFormField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final String? initialValue;
  final Color? color;

  const CustomTextFormField({
    Key? key,
    this.labelText,
    this.hintText,
    this.initialValue,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      style: semiBold.copyWith(
        fontSize: 16,
        color: color ?? darkHover,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        hintStyle: semiBold.copyWith(
          fontSize: 16,
          color: lightActive,
        ),
        labelStyle: medium.copyWith(
          color: lightActive,
          fontSize: 13,
        ),
      ),
    );
  }
}
