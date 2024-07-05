import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import '../data/models/line_chart_model.dart';
import '../data/services/line_chart_services.dart';
import '../mixins/month_mixins.dart';

class StatisticsController extends GetxController with MonthMixins {
  RxList<FlSpot> incomeData = <FlSpot>[].obs;
  RxList<FlSpot> expenseData = <FlSpot>[].obs;
  RxList<FlSpot> profitData = <FlSpot>[].obs;
  RxInt incomeAmount = 0.obs;
  RxInt expenseAmount = 0.obs;
  RxInt profitAmount = 0.obs;
  RxInt maxY = 100.obs;
  RxBool isLoading = true.obs;
  Rx<DateTime?> selectedMonth = DateTime.now().obs;

  final LineChartServices lineChartServices = LineChartServices();

  @override
  void onInit() {
    super.onInit();
    loadChartData();
  }

  double calculateMaxY(List<FlSpot> incomeData, List<FlSpot> expenseData,
      List<FlSpot> profitData) {
    double maxIncomeY =
        incomeData.map((spot) => spot.y).reduce((a, b) => a > b ? a : b);
    double maxExpenseY =
        expenseData.map((spot) => spot.y).reduce((a, b) => a > b ? a : b);
    double maxProfitY =
        profitData.map((spot) => spot.y).reduce((a, b) => a > b ? a : b);
    double maxY =
        [maxIncomeY, maxExpenseY, maxProfitY].reduce((a, b) => a > b ? a : b);

    return maxY * 1.1; // Adding 10% margin
  }

  Future<void> loadChartData() async {
    try {
      isLoading(true);
      print(
          'currentMonth: ${currentMonth.value.toString()}, currentYear: ${currentYear.value.toString()}');
      LineChartModel data = await lineChartServices.getLineChart(
          month: currentMonth.value.toString(),
          years: currentYear.value.toString());
      incomeData.value = data.data.multipleChart.income
          .map((coord) => FlSpot(coord.x.toDouble(), coord.y.toDouble()))
          .toList();
      expenseData.value = data.data.multipleChart.expense
          .map((coord) => FlSpot(coord.x.toDouble(), coord.y.toDouble()))
          .toList();
      profitData.value = data.data.multipleChart.profit
          .map((coord) => FlSpot(coord.x.toDouble(), coord.y.toDouble()))
          .toList();
      maxY.value = calculateMaxY(incomeData, expenseData, profitData).toInt();
      incomeAmount.value = data.data.summary.pemasukan;
      expenseAmount.value = data.data.summary.pengeluaran;
      profitAmount.value = data.data.summary.keuntungan;
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }

  // void changeMonth(DateTime? month) {
  //   selectedMonth.value = month;
  //   print(selectedMonth.value);
  //   // loadChartData();
  // }

  void submitSelectedMonth() {
    print(currentMonth);
    loadChartData();
    Get.back();
  }
}
