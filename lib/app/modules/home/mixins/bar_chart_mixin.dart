import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:intl/intl.dart';
import 'package:tatarupiah/app/modules/home/data/models/bar_chart_model.dart';

import '../data/services/bar_chart_services.dart';
import '../views/components/bar graph/bar_data.dart';

mixin BarchartMixin on GetxController {
  RxString dropdownValue = "Pemasukan".obs;
  RxInt selectedBarIndex = 0.obs;
  RxString endOfWeek = ''.obs;
  RxInt totalAmount = 0.obs;
  Rx<DateTime> date = DateTime.now().obs;
  RxString initialDate = DateFormat('yyyy-MM-dd')
      .format(DateTime.now().add(Duration(days: 7 - DateTime.now().weekday)))
      .obs;
  RxList<BarChartValue> listBarData = <BarChartValue>[].obs;
  List<DateTime> get daysInWeek => _daysInWeek;
  RxDouble maxY = 100.0.obs;
  var daysOfWeek = <String>[].obs;
  var barData = BarData();
  final _daysInWeek = <DateTime>[].obs;
  final BarChartServices barChartServices = BarChartServices();

  void fetchBarChartData() async {
    try {
      // Pastikan tanggal akhir adalah hari Minggu untuk memuat 7 hari sebelumnya
      //replace date.value with endOfWeek.value
      // DateTime now = DateTime.now();
      // DateTime endOfWeek = now.add(Duration(days: 7 - now.weekday));
      // initialDate.value = DateFormat('yyyy-MM-dd').format(endOfWeek);
      BarChartModel barChartModel = await BarChartServices()
          .getBarChart(endDate: initialDate.value, type: dropdownValue.value);
      barChartModel.data
          .sort((a, b) => a.date.compareTo(b.date)); // Sort data by date
      barData.initializeBarData(barChartModel.data);
      daysOfWeek.value = barChartModel.data.map((value) {
        return DateFormat.E('id').format(value.date); // Format to day name
      }).toList();
      maxY.value = calculateMax(barChartModel.data);
      totalAmount.value = calculateTotalAmount(barChartModel.data);
      update();
    } catch (e) {
      // Handle error
    }
  }

  void selectedDate(DateTime value) {
    initialDate.value = DateFormat('yyyy-MM-dd').format(value);
    fetchBarChartData();
  }

//  void setSelectedBarIndex(BarTouchResponse barTouchResponse) {
//     selectedBarIndex.value = barTouchResponse.spot!.touchedBarGroupIndex;
//     update();
//   }

  double calculateMax(List<BarChartValue> data) {
    //setting for max value of y axis
    if (data.isEmpty) return 100.0;
    double max =
        data.map((d) => d.amount.toDouble()).reduce((a, b) => a > b ? a : b);
    return max * 1.1; // Increase cap slightly
  }

  int calculateTotalAmount(List<BarChartValue> data) {
    return data.fold(0, (sum, item) => sum + item.amount);
  }

  void setSelectedBarIndex(FlTouchEvent event, BarTouchResponse? response) {
    if (response != null && response.spot != null) {
      final int tappedIndex = response.spot!.touchedBarGroupIndex;
      selectedBarIndex.value = tappedIndex;
      update();
    }
  }

  void currentWeek() {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 7));
    endOfWeek.value = DateFormat('yyyy-MM-dd').format(startOfWeek);
    print('startOfWeek: $endOfWeek');
  }

  void setSelected(String value) {
    dropdownValue.value = value;
    fetchBarChartData();
  }
}
