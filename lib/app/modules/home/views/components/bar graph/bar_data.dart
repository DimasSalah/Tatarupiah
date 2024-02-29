
import 'individual_bar.dart';

class Bardata {
  late final double sunAmmount;
  final double monAmmount;
  final double tueAmmount;
  final double wedAmmount;
  final double thuAmmount;
  final double friAmmount;
  final double satAmmount;

  Bardata({
    required this.sunAmmount,
    required this.monAmmount,
    required this.tueAmmount,
    required this.wedAmmount,
    required this.thuAmmount,
    required this.friAmmount,
    required this.satAmmount,

  });

  List<IndividualBar> barData = [];

  void initializeBarData() {
    barData = [
      IndividualBar(x: 0, y: sunAmmount),
      IndividualBar(x: 1, y: monAmmount),
      IndividualBar(x: 2, y: tueAmmount),
      IndividualBar(x: 3, y: wedAmmount),
      IndividualBar(x: 4, y: thuAmmount),
      IndividualBar(x: 5, y: friAmmount),
      IndividualBar(x: 6, y: satAmmount),
    ];
  }
}