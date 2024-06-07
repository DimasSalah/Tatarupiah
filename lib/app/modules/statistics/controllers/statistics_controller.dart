import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../service/model/statistic_model.dart';

class StatisticsController extends GetxController {
  var incomeData = <FlSpot>[].obs;
  var expenseData = <FlSpot>[].obs;
  var profitData = <FlSpot>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadChartData();
  }

  Future<void> loadChartData() async {
    final String response = await rootBundle.loadString('assets/images/chart_data.json');
    final data = ApiResponse.fromJson(jsonDecode(response)).data;

    incomeData.value = data.income.map((coord) => FlSpot(coord.x, coord.y)).toList();
    expenseData.value = data.expense.map((coord) => FlSpot(coord.x, coord.y)).toList();
    profitData.value = data.profit.map((coord) => FlSpot(coord.x, coord.y)).toList();
  }
}
