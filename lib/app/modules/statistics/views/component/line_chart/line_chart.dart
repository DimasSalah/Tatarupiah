import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/currency_format.dart';
import '../../../controllers/statistics_controller.dart';
import '../../../../../style/colors.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final StatisticsController controller = Get.put(StatisticsController());

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      width: 340,
      height: 250,
      child: Obx(() {
        if (controller.incomeData.isEmpty ||
            controller.expenseData.isEmpty ||
            controller.profitData.isEmpty) {
          return Center(
            child: CircularProgressIndicator(
              color: white,
            ), // Display a loading indicator
          );
        }

        return LineChart(
          LineChartData(
            lineTouchData: LineTouchData(
              touchTooltipData: LineTouchTooltipData(
                tooltipBgColor: lightHover.withOpacity(0.2),
                getTooltipItems: (List<LineBarSpot> touchedSpots) {
                  return touchedSpots.map((spot) {
                    final text = currencyFormatWithKDouble(spot.y.toString());
                    return LineTooltipItem(
                      text,
                      TextStyle(
                        color: spot.bar.color,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }).toList();
                },
              ),
              handleBuiltInTouches: true,
            ),
            gridData: const FlGridData(show: false),
            borderData: FlBorderData(show: false),
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: bottomTitles(),
              ),
              rightTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              leftTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false), // Hide left titles
              ),
            ),
            lineBarsData: [
              createLineChartBarData(
                controller.incomeData,
                color: greenAccent,
              ),
              createLineChartBarData(
                controller.expenseData,
                color: error,
              ),
              createLineChartBarData(
                controller.profitData,
                color: white,
              ),
            ],
            minY: 0,
            maxY: controller.maxY.value.toDouble(),
          ),
        );
      }),
    );
  }

  LineChartBarData createLineChartBarData(List<FlSpot> spots,
      {required Color color}) {
    return LineChartBarData(
      isCurved: true,
      color: color,
      barWidth: 8,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: true,
        getDotPainter: (spot, percent, barData, index) =>
            FlDotCirclePainter(radius: 10, color: color.withOpacity(0.5)),
      ),
      belowBarData: BarAreaData(show: false),
      spots: spots,
    );
  }

  Widget bottomTitleWidget(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.white,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w400,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text(
          'Minggu 1',
          style: style,
        );
        break;
      case 1:
        text = const Text(
          'Minggu 2',
          style: style,
        );
        break;
      case 2:
        text = const Text(
          'Minggu 3',
          style: style,
        );
        break;
      case 3:
        text = const Text(
          'Minggu 4',
          style: style,
        );
        break;
      default:
        text = const Text(
          '',
          style: style,
        );
        break;
    }
    return SideTitleWidget(axisSide: meta.axisSide, space: 10, child: text);
  }

  SideTitles bottomTitles() => SideTitles(
        getTitlesWidget: bottomTitleWidget,
        showTitles: true,
        interval: 1,
        reservedSize: 30,
      );
}
