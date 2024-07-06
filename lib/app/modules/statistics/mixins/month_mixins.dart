import 'package:get/get.dart';

mixin MonthMixins on GetxController {
  RxInt selectedIndex = DateTime.now().month.obs;
  RxInt currentMonth = DateTime.now().month.obs;
  RxInt currentYear = 2024.obs;

  void addCurrentYear() {
    currentYear.value++;
  }

  void subtractCurrentYear() {
    currentYear.value--;
  }

  void toggleSelection(int newIndex) {
    selectedIndex.value = newIndex;
  }

  final List<Map<int, String>> months = [
    {1: 'Jan'},
    {2: 'Feb'},
    {3: 'Mar'},
    {4: 'Apr'},
    {5: 'Mei'},
    {6: 'Jun'},
    {7: 'Jul'},
    {8: 'Agu'},
    {9: 'Sep'},
    {10: 'Okt'},
    {11: 'Nov'},
    {12: 'Des'},
  ];

  void handleMonthChange(int monthValue) {
    currentMonth.value = monthValue;
    print(currentMonth);
    toggleSelection(monthValue);
  }

  
}
