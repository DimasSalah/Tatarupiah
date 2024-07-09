import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tatarupiah/app/utils/currency_format.dart';

import '../../../../style/colors.dart';
import '../../../../style/text_style.dart';

class TransactionCard extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;
  final String price;
  final String type;
  final Function()? onLongPress;
  const TransactionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.type,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      child: Container(
        // padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.only(bottom: 10, left: 23, right: 23),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 0, right: 0, top: 8, bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: dark,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: SvgPicture.asset(icon),
                  ),
                  const SizedBox(width: 17),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: medium.copyWith(fontSize: 16, color: normal),
                      ),
                      Text(
                        subtitle,
                        style: regular.copyWith(fontSize: 13, color: lightActive),
                      )
                    ],
                  )
                ],
              ),
              Text(
                currencyViewFormatter(price),
                style: semiBold.copyWith(fontSize: 20, color: type == 'Pemasukan' ? success : error),
              )
            ],
          ),
        ),
      ),
    );
  }
}
