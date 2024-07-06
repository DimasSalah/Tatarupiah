import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../style/colors.dart';
import '../../../../style/text_style.dart';


class PerformanceCard extends StatelessWidget {
  final int no;
  final String name;
  final String price;
  const PerformanceCard({
    super.key,
    required this.no,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 23),
            child: Text(
              '0$no',
              style: semiBold.copyWith(fontSize: 22),
            ),
          ),
          const Gap(10),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 23),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
              decoration: BoxDecoration(
                  color: light, borderRadius: BorderRadius.circular(16)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(name,
                      style: medium.copyWith(fontSize: 14, color: normal)),
                  Text(price,
                      style: medium.copyWith(fontSize: 14, color: normal)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
