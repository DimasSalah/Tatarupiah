import 'package:flutter/material.dart';
import 'package:tatarupiah/app/style/colors.dart';

class CustomTextFieldContainer extends StatelessWidget {
  final String labelText;
  final String hintText;

  const CustomTextFieldContainer({
    Key? key,
    required this.labelText,
    required this.hintText,
    required Null Function(dynamic value) onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: lightHover,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: lighter, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
