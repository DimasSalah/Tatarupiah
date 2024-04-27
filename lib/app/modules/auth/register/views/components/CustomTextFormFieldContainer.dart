import 'package:flutter/material.dart';
import 'package:tatarupiah/app/style/colors.dart';

class CustomTextFieldContainer extends StatelessWidget {
  final String labelText;
  final String hintText;
  final Function(String) onChanged;

  const CustomTextFieldContainer({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: light,
      child: TextFormField(
        onChanged: onChanged,
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
