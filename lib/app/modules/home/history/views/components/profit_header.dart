import 'package:flutter/material.dart';

import '../../../../../style/colors.dart';
import '../../../../../style/text_style.dart';

class ProfitHeader extends StatelessWidget {
  final String profit;
  final String date;
  const ProfitHeader({
    super.key,
    required this.profit,
    required this.date,
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
          Text(
            date,
            style: medium.copyWith(fontSize: 13, color: normal),
          ),
        ],
      ),
    );
  }
}
