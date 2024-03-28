import 'package:flutter/material.dart';
import 'package:tatarupiah/app/style/colors.dart';
import 'package:tatarupiah/app/style/text_style.dart';

class CustomTextFormField extends StatelessWidget {
  final String? labelText;
  final String? hintText;

  const CustomTextFormField({
    Key? key,
    this.labelText,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: semiBold.copyWith(
        fontSize: 16,
        color: darkHover,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        labelStyle: medium.copyWith(
          color: lightActive,
          fontSize: 13,
        ),
      ),
    );
  }
}
