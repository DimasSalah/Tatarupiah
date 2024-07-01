import 'package:flutter/material.dart';
import 'package:tatarupiah/app/style/colors.dart';

import '../../../../../style/text_style.dart';

class CustomTextFieldContainer extends StatelessWidget {
  final String labelText;
  final String hintText;
  bool? obscureText;
  final Function(String) onChanged;
  final Widget? icon;

  CustomTextFieldContainer(
      {Key? key,
      required this.labelText,
      required this.hintText,
      this.obscureText,
      required this.onChanged,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: regular.copyWith(fontSize: 14, color: dark),
      obscureText: obscureText ?? false,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: regular.copyWith(fontSize: 14, color: lightActive),
        isDense: false,
        filled: true,
        fillColor: const Color(0xFFECECEC),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: normal, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: lighter, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: error, width: 1),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(10),
          child: icon ?? null,
        ),
      ),
    );
  }
}
