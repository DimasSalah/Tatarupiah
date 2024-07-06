import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:tatarupiah/app/style/colors.dart';
import 'package:tatarupiah/app/style/text_style.dart';

class CustomTextContainer extends StatelessWidget {
  final String text;
  final TextStyle style;
  final String title;
  // final Color shadowColor;

  const CustomTextContainer({
    Key? key,
    required this.text,
    required this.style,
    required this.title,
    // this.shadowColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: regular.copyWith(fontSize: 14, color: dark),
        ),
        const Gap(4),
        Container(
          padding: const EdgeInsets.only(left: 14, top: 11, bottom: 13),
          margin: const EdgeInsets.only(bottom: 10),
          height: 44,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: light,
            border: Border.all(
              color: lighter,
            ),
          ),
          child: Text(text, style: style),
        ),
      ],
    );
  }
}
