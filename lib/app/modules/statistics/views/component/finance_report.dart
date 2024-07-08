import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../style/colors.dart';
import '../../../../style/text_style.dart';

class FinanceReport extends StatelessWidget {
  final String income;
  final String expense;
  final String profit;
  const FinanceReport({
    super.key,
    required this.income,
    required this.expense,
    required this.profit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 23, left: 23, right: 23),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Laporan Keuangan",
            style: medium.copyWith(fontSize: 20, color: normal),
          ),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: darkHover,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/stream_up.svg',
                          height: 20,
                        ),
                      ),
                      const Gap(12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pendapatan",
                            style: medium.copyWith(
                                fontSize: 13, color: lightActive),
                          ),
                          Text(
                            'Rp $income',
                            style:
                                semiBold.copyWith(fontSize: 20, color: normal),
                          )
                        ],
                      )
                    ],
                  ),
                  const Gap(12),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: darkHover,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/stream_down.svg',
                        ),
                      ),
                      const Gap(12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pendapatan",
                            style: medium.copyWith(
                                fontSize: 13, color: lightActive),
                          ),
                          Text(
                            'Rp $expense',
                            style:
                                semiBold.copyWith(fontSize: 20, color: normal),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  SvgPicture.asset(
                    'assets/icons/coin.svg',
                  ),
                  const Gap(10),
                  Text('Rp $profit',
                      style:
                          semiBold.copyWith(fontSize: 20, color: greenAccent))
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
