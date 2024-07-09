import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tatarupiah/app/modules/home/views/components/header_bar.dart';
import 'package:tatarupiah/app/modules/statistics/views/component/line_chart/line_chart.dart';
import 'package:tatarupiah/app/utils/currency_format.dart';
import '../../../routes/app_pages.dart';
import '../../../style/colors.dart';
import '../../../style/text_style.dart';
import '../controllers/statistics_controller.dart';
import 'component/divider_line.dart';
import 'component/finance_report.dart';
import 'component/month_filter.dart';
import 'component/performance_card.dart';

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
             Obx(
                () => HeaderBar(
                  avatar: controller.userController.imgProfile.string == ''
                      ? 'https://www.tenforums.com/attachments/user-accounts-family-safety/322690d1615743307t-user-account-image-log-user.png'
                      : controller.userController.imgProfile.string,
                  onTap: () {
                    Get.toNamed(Routes.PROFILE);
                  },
                ),
              ),
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
                        GestureDetector(
                          onTap: () {
                            Get.dialog(const MonthFilter());
                          },
                          child: SvgPicture.asset(
                            'assets/icons/calendar.svg',
                            height: 34,
                          ),
                        )
                      ],
                    ),
                    //line chart
                    const LineChartWidget()
                  ],
                ),
              ),
              const Gap(20),
              const DividerLine(
                indent: 23,
                endIndent: 23,
              ),
              Obx(() {
                return FinanceReport(
                  income:
                      currencyFormatWithK(controller.incomeAmount.toString()),
                  expense:
                      currencyFormatWithK(controller.expenseAmount.toString()),
                  profit:
                      currencyFormatWithK(controller.profitAmount.toString()),
                );
              }),
              const DividerLine(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 23, vertical: 5),
                child: Text(
                  'Performa Penjualan',
                  style: medium.copyWith(fontSize: 20),
                ),
              ),
              const DividerLine(),
              Obx(() {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.performaPenjualan.length,
                  itemBuilder: (context, index) {
                    return PerformanceCard(
                      no: index + 1,
                      name: controller.performaPenjualan[index].category,
                      price: currencyFormatWithK(
                          controller.performaPenjualan[index].totalPenjualan),
                    );
                  },
                );
              }),
              const Gap(26),
            ],
          ),
        ),
      ),
    );
  }
}
