import 'package:flutter/material.dart';

import '../../../../../style/colors.dart';
import '../../../../../style/text_style.dart';

class CategoryListCard extends StatelessWidget {
  final String title;
  const CategoryListCard({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(
        horizontal: 23,
        vertical: 10,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: lightActive,
            width: 1,
          ),
        ),
      ),
      child: Text(
        title,
        style: regular.copyWith(
          fontSize: 16,
          color: lightActive,
        ),
      ),
    );
  }
}
