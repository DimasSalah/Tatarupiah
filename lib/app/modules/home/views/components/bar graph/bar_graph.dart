import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:tatarupiah/app/style/text_style.dart';
import '../../../../../style/colors.dart';
import '../../../../../style/gradient.dart';
import '../../../../../utils/currency_format.dart';
import '../../../controllers/home_controller.dart';

class BarGraph extends StatelessWidget {
  BarGraph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return BarChart(
          BarChartData(
            maxY: controller.maxY.value,
            minY: 0,
            gridData: FlGridData(show: false),
            borderData: FlBorderData(show: false),
            barTouchData: BarTouchData(
              enabled: true,
              touchCallback: controller.setSelectedBarIndex,
              touchTooltipData: BarTouchTooltipData(
                tooltipHorizontalAlignment: FLHorizontalAlignment.center,
                tooltipBgColor: Colors.transparent,
                tooltipPadding: const EdgeInsets.all(0),
                tooltipMargin: -3,
                getTooltipItem: (
                  BarChartGroupData group,
                  groupIndex,
                  BarChartRodData rod,
                  int rodIndex,
                ) {
                  double actualValue = controller.barData.barData[groupIndex].y;
                  return BarTooltipItem(
                    currencyFormatWithK(actualValue
                        .round()
                        .toString()), // Display original value in tooltip
                    semiBold.copyWith(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  );
                },
              ),
            ),
            titlesData: FlTitlesData(
              show: true,
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles:
                  AxisTitles(sideTitles: SideTitles(showTitles: false)),
              leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (double value, TitleMeta meta) {
                    int index = value.toInt();
                    return Text(
                      controller.daysOfWeek.isNotEmpty
                          ? controller.daysOfWeek[index]
                          : '',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    );
                  },
                ),
              ),
            ),
            barGroups: controller.barData.barData
                .map(
                  (data) => BarChartGroupData(
                    x: data.x,
                    barRods: [
                      BarChartRodData(
                        toY: data.y.abs(), // Display absolute value
                        width: Get.width / 8.5,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(14),
                          topRight: Radius.circular(14),
                        ),
                        borderSide: controller.selectedBarIndex.value == data.x
                            ? BorderSide(
                                color: data.y < 0 ? Colors.red : greenAccent,
                                width: 2,
                              )
                            : BorderSide(
                                width: 2,
                                color: data.y < 0 ? error : Colors.transparent,
                              ),
                        gradient: data.y < 0 // Check if the value is negative
                            ? controller.selectedBarIndex.value == data.x
                                ? LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [Colors.red, error],
                                  )
                                : LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [light, error],
                                  )
                            : controller.selectedBarIndex.value == data.x
                                ? primary
                                : LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [light, light],
                                  ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}
