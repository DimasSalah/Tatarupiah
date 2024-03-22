import 'package:flutter/material.dart';

import '../../../../style/colors.dart';
import '../../../../style/text_style.dart';

class TransactionsCard extends StatelessWidget {
  const TransactionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    color: dark,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child:  Icon(
                    Icons.drive_eta_outlined,
                    color: light,
                  ),
                ),
                const SizedBox(
                  width: 17.5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pembelian",
                      style: medium.copyWith(fontSize: 16, color: normal),
                    ),
                    Text(
                      "Pembelian Pulsa",
                      style: regular.copyWith(fontSize: 13, color: lightActive),
                    )
                  ],
                )
              ],
            ),
            Text(
              "Rp 27.000",
              style: semiBold.copyWith(fontSize: 20, color: success),
            )
          ],
        ),
      ),
    );
  }
}
