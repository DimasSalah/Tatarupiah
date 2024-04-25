import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../../style/colors.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      width: 340,
      height: 250,
      child: LineChart(
        LineChartData(
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              tooltipBgColor: Colors.transparent,
              // getTooltipItems: (List<LineBarSpot> touchedSpots) {
              //   return touchedSpots.map((LineBarSpot touchedSpot) {
              //     final TextStyle textStyle = TextStyle(
              //       color: white,
              //       fontWeight: FontWeight.bold,
              //       fontSize: 14,
              //     );
              //     return LineTooltipItem(
              //       touchedSpot.y.toString(),
              //       textStyle,
              //     );
              //   }).toList();
              // },
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
              sideTitles: SideTitles(showTitles: false),
              // leftTitles(),
            ),
          ),
          lineBarsData: [
            expanseLineChart,
            incomeLineChart,
            profitLinechart,
          ],
          minY: 0,
          maxY: 4,
        ),
      ),
    );
  }

  LineChartBarData get incomeLineChart => LineChartBarData(
        isCurved: true,
        color: greenAccent,
        barWidth: 8,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: true,
          getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
              radius: 8, color: greenAccent.withOpacity(0.5)),
        ),
        belowBarData: BarAreaData(show: false),
        spots: [
          //angka pertama x dan angka kedua y
          const FlSpot(0, 1.6),
          const FlSpot(1, 2.7),
          const FlSpot(2, 1),
          const FlSpot(3, 1.6),
        ],
      );

  LineChartBarData get expanseLineChart => LineChartBarData(
        isCurved: true,
        color: error,
        barWidth: 8,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: true,
          getDotPainter: (spot, percent, barData, index) =>
              FlDotCirclePainter(radius: 8, color: error.withOpacity(0.5)),
        ),
        belowBarData: BarAreaData(show: false),
        spots: [
          //angka pertama x dan angka kedua y
          const FlSpot(0, 0.5),
          const FlSpot(1, 2),
          const FlSpot(2, 3.2),
          const FlSpot(3, 1.9),
        ],
      );

  LineChartBarData get profitLinechart => LineChartBarData(
        isCurved: true,
        color: white,
        barWidth: 8,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: true,
          getDotPainter: (spot, percent, barData, index) =>
              FlDotCirclePainter(radius: 8, color: white.withOpacity(0.5)),
        ),
        belowBarData: BarAreaData(show: false),
        spots: [
          //angka pertama x dan angka kedua y
          const FlSpot(0, 2),
          const FlSpot(1, 1),
          const FlSpot(2, 2),
          const FlSpot(3, 0.8),
        ],
      );

  Widget leftTitleWidget(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.red,
      fontSize: 12,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0';
        break;
      case 1:
        text = '3';
        break;
      case 2:
        text = '5';
        break;
      case 3:
        text = '7';
        break;
      case 4:
        text = '10';
        break;
      default:
        return const SizedBox();
    }
    return Text(
      text,
      style: style,
    );
  }

  SideTitles leftTitles() => SideTitles(
        getTitlesWidget: leftTitleWidget,
        showTitles: true,
        interval: 1,
        reservedSize: 28,
      );

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
          '7 Hari',
          style: style,
        );
        break;
      case 1:
        text = const Text(
          '14 Hari',
          style: style,
        );
        break;
      case 2:
        text = const Text(
          '21 Hari',
          style: style,
        );
        break;
      case 3:
        text = const Text(
          '28 Hari',
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
