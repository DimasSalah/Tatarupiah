import 'package:flutter/material.dart';
import 'package:tatarupiah/app/style/colors.dart';
import 'package:tatarupiah/app/style/text_style.dart';

class CustomTextContainer extends StatelessWidget {
  final String text;
  final TextStyle style;
  // final Color shadowColor;

  const CustomTextContainer({
    Key? key,
    required this.text,
    required this.style,
    // this.shadowColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: light,
        border: Border.all(
          color: lighter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 11, bottom: 13),
        child: Text(text, style: style),
      ),
    );
  }
}
