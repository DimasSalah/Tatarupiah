import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:tatarupiah/app/modules/home/views/components/header_bar.dart';
import 'package:tatarupiah/app/modules/statistics/views/component/line_chart/line_chart.dart';
import 'package:tatarupiah/app/style/gradient.dart';

import '../../../style/colors.dart';
import '../../../style/text_style.dart';
import '../controllers/statistics_controller.dart';
import 'component/divider_line.dart';
import 'component/finance_report.dart';

class StatisticsView extends GetView<StatisticsController> {
  const StatisticsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderBar(),
              //main content
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                padding: const EdgeInsets.all(25),
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: dark,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(40),
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          DateFormat('MMMM').format(DateTime.now()),
                          style: medium.copyWith(fontSize: 25, color: white),
                        ),
                        SvgPicture.asset(
                          'assets/icons/calendar.svg',
                          height: 34,
                        )
                      ],
                    ),
                    //line chart
                    const LineChartWidget()
                  ],
                ),
              ),
              const Gap(20),
              const DividerLine(),
              const FinanceReport(),
              const DividerLine(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Target Pendapatan",
                      style: medium.copyWith(fontSize: 20, color: normal),
                    ),
                    const Gap(2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Rp 6.500.000/",
                          style: medium.copyWith(fontSize: 16, color: lightActive),
                        ),
                        Text(
                          "7.000.000",
                          style: medium.copyWith(fontSize: 16, color: lightActive),
                        ),
                        const Spacer(),
                        Icon(Icons.edit, color: lightActive, size: 22)
                      ],
                    ),
                    const Gap(8),
                    LinearPercentIndicator(
                      animation: true,
                      lineHeight: 36.0,
                      animationDuration: 1000,
                      percent: 0.9,
                      center: Text(
                        "90.0%",
                        style: bold.copyWith(color: dark),
                      ),
                      barRadius: const Radius.circular(20),
                      linearGradient: primary,
                      padding: EdgeInsets.zero,
                    ),
                    const Gap(10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
