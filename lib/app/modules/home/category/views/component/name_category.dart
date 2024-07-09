import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../style/colors.dart';
import '../../../../../style/text_style.dart';
import '../../controllers/category_controller.dart';


class NameCategory extends StatelessWidget {
  final String name;
  final Function() onTap;
  const NameCategory({
    super.key,
    required this.name,
    required this.onTap,
  });


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: regular.copyWith(fontSize: 16, color: lightActive),
        ),
        GestureDetector(
          onTap: onTap,
          child: SvgPicture.asset(
            'assets/icons/add.svg',
            width: 15,
          ),
        ),
      ],
    );
  }
}
