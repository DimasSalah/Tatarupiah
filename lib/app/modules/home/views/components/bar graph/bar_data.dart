import '../../../data/models/bar_chart_model.dart';
import 'individual_bar.dart';

class BarData {
  List<IndividualBar> barData = [];

  void initializeBarData(List<BarChartValue> values) {
    barData = values.asMap().entries.map((entry) {
      int index = entry.key;
      BarChartValue value = entry.value;
      return IndividualBar(x: index, y: value.amount.toDouble());
    }).toList();
  }
}
