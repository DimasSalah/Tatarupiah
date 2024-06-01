import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../../style/colors.dart';
import '../../../../../style/text_style.dart';

class SubCategoryCard extends StatelessWidget {
  final String subName;
  final Function()? onDelete;
  const SubCategoryCard({
    super.key,
    required this.subName,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            color: dark,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Icon(
            Icons.drive_eta_outlined,
            color: light,
          ),
        ),
        const Gap(20),
        Expanded(
          child: Text(
            subName,
            style: regular.copyWith(fontSize: 14, color: dark),
          ),
        ),
        GestureDetector(
          onTap: onDelete,
          child: SvgPicture.asset(
            'assets/icons/delete.svg',
          ),
        ),
      ],
    );
  }
}
