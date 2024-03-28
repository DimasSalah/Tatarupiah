import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:tatarupiah/app/modules/home/views/components/TransactionCard.dart';
import 'package:tatarupiah/app/style/colors.dart';
import 'package:tatarupiah/app/style/text_style.dart';
import 'package:tatarupiah/app/utils/date_format.dart';

import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/arrow_left.svg',
            width: 12,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/calendar_dark.svg',
              ),
            ),
          )
        ],
        title: Text(
          'Riwayat Transaksi',
          style: semiBold.copyWith(fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 23, vertical: 12),
            decoration: BoxDecoration(
              border: Border.symmetric(
                horizontal: BorderSide(color: lightActive),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Rp 27k',
                  style: semiBold.copyWith(fontSize: 25, color: success),
                ),
                Text(
                  statusDate(DateTime.now()),
                  style: medium.copyWith(fontSize: 13, color: normal),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 23),
            child: TransactionsCard(),
          ),
          Gap(10),
          
        ],
      ),
    );
  }
}
