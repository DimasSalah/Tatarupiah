import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:gap/gap.dart';

import '../../../../../style/colors.dart';
import '../../../../../style/gradient.dart';
import '../../../../../style/text_style.dart';


class AddingCategory extends StatelessWidget {
  const AddingCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              gradient: primary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: SvgPicture.asset(
              'assets/icons/add.svg',
              width: 14,
            ),
          ),
          const Gap(20),
          Text(
            'Tambah Kategori',
            style: regular.copyWith(
              fontSize: 16,
              color: dark,
            ),
          ),
        ],
      );
  }
}
