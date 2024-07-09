import 'package:flutter/material.dart';
import 'package:tatarupiah/app/style/colors.dart';
import 'package:tatarupiah/app/style/text_style.dart';

class CustomTextFormField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final String? initialValue;
  final Color? color;
  final bool? obscureText;
  final Widget? icon;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    Key? key,
    this.labelText,
    this.hintText,
    this.initialValue,
    this.color,
    this.obscureText,
    this.icon,
    this.keyboardType,
    this.controller,
    this.validator,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType,
      validator: validator,
      style: semiBold.copyWith(
        fontSize: 16,
        color: color ?? darkHover,
      ),
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: const EdgeInsets.all(10),
          child: icon ?? null,
        ),
        focusColor: greenAccent,
        labelText: labelText,
        hintText: hintText,
        hintStyle: semiBold.copyWith(
          fontSize: 16,
          color: lightActive,
        ),
        labelStyle: semiBold.copyWith(
          color: lightActive,
          fontSize: 16,
        ),
      ),
    );
  }
}
