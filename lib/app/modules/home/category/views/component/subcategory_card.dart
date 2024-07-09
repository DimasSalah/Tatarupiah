import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../style/colors.dart';
import '../../../../../style/text_style.dart';

class SubCategoryCard extends StatelessWidget {
  final String subName;
  final String icon;
  final Function()? onTap;
  final Function()? onDelete;
  const SubCategoryCard({
    super.key,
    required this.subName,
    required this.icon,
    this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(8),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: dark,
                borderRadius: BorderRadius.circular(24),
              ),
              child: SvgPicture.asset(
                icon,
              )),
          const Gap(20),
          Expanded(
            child: Text(
              subName,
              textAlign: TextAlign.start,
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
      ),
    );
  }
}
