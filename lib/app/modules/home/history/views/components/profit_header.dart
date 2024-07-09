import 'package:flutter/material.dart';

import '../../../../../style/colors.dart';
import '../../../../../style/text_style.dart';

class ProfitHeader extends StatelessWidget {
  final String profit;
  final String date;
  final String countTransaction;
  const ProfitHeader({
    super.key,
    required this.profit,
    required this.date,
    required this.countTransaction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 12),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(color: lightActive),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Rp $profit',
            style: semiBold.copyWith(fontSize: 25, color: success),
          ),
          // CircleAvatar(
          //   backgroundColor: dark,
          //   radius: 15,
          //   child: Text(
          //     countTransaction,
          //     style: regular.copyWith(fontSize: 13, color: white),
          //   ),
          // ),
          Text(
            date,
            style: medium.copyWith(fontSize: 13, color: normal),
          ),
        ],
      ),
    );
  }
}
