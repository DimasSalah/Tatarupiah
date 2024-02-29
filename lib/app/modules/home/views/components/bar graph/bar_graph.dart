import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:tatarupiah/app/style/gradient.dart';
import 'package:tatarupiah/app/style/text_style.dart';
import '../../../../../style/colors.dart';
import '../../../controllers/home_controller.dart';

class BarGraph extends StatelessWidget {
  BarGraph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return BarChart(
          BarChartData(
            maxY: 100,
            minY: 0,
            gridData: FlGridData(
              show: false,
            ),
            borderData: FlBorderData(
              show: false,
            ),
            
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
                  return BarTooltipItem(
                    rod.toY.round().toString(),
                    semiBold.copyWith(color: light, fontSize: 20),
                  );
                },
              ),
            ),
            titlesData: const FlTitlesData(
              show: true,
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles:
                  AxisTitles(sideTitles: SideTitles(showTitles: false)),
              leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, getTitlesWidget: getBottomTitle)),
            ),
            barGroups: controller.mybarData.barData
                .map(
                  (data) => BarChartGroupData(
                    x: data.x,
                    barRods: [
                      BarChartRodData(
                        toY: data.y,
                        width: 49,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(14),
                          topRight: Radius.circular(14),
                        ),
                        borderSide: controller.selectedBarIndex.value == data.x
                            ? BorderSide(
                                color: greenYellow,
                                width: 2,
                              )
                            : BorderSide.none,
                        gradient: controller.selectedBarIndex.value == data.x
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


Widget getBottomTitle(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.white,
    fontSize: 12,
  );

  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text(
        'min',
        style: style,
      );
      break;
    case 1:
      text = const Text(
        'sen',
        style: style,
      );
      break;
    case 2:
      text = const Text(
        'sel',
        style: style,
      );
      break;
    case 3:
      text = const Text(
        'rab',
        style: style,
      );
      break;
    case 4:
      text = const Text(
        'kam',
        style: style,
      );
      break;
    case 5:
      text = const Text(
        'jum',
        style: style,
      );
      break;
    case 6:
      text = const Text(
        'sab',
        style: style,
      );
      break;
    default:
      text = const SizedBox(); // Jika nilai tidak sesuai, kembalikan widget kosong
      break;
  }
  return SideTitleWidget(child: text, axisSide: meta.axisSide);
}
