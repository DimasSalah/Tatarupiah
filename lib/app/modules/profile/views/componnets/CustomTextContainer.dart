import 'package:flutter/material.dart';
import 'package:tatarupiah/app/style/colors.dart';

class CustomTextContainer extends StatelessWidget {
  final String text;
  // final Color color;
  // final Color shadowColor;

  const CustomTextContainer({
    Key? key,
    required this.text,
    // this.color = Colors.white,
    // this.shadowColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: double.infinity,
      decoration: BoxDecoration(
        color: light,
        border: Border.all(
          color: lighter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 11, bottom: 13),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
