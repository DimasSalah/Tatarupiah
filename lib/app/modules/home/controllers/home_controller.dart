import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tatarupiah/app/data/api/profile_service.dart';
import 'package:tatarupiah/app/modules/home/views/components/bar%20graph/bar_data.dart';
import 'package:tatarupiah/app/routes/app_pages.dart';

class HomeController extends GetxController {
  RxDouble maxY = 200.0.obs;
  RxInt selectedBarIndex = 0.obs;
  RxString dropdownValue = "Pemasukan".obs;
  RxString image = "".obs;
  RxString name = "".obs;

  Future<void> getProfile() async {
    final profileService = ProfileService();
    await profileService.getUser().then((value) {
      image.value = value.data.image;
    });
  }

  void navigationToTransaction() {
    Get.toNamed(Routes.TRANSACTION);
  }

  void navigationToHistory() {
    Get.toNamed(Routes.HISTORY);
  } 
  

  void setSelectedBarIndex(FlTouchEvent event, BarTouchResponse? response) {
    if (response != null && response.spot != null) {
    final int tappedIndex = response.spot!.touchedBarGroupIndex;
    selectedBarIndex.value = tappedIndex;
    update();
  }
  }

  void setSelected(String value){
     dropdownValue.value = value;
   }

  Bardata mybarData = Bardata(
    sunAmmount: 25.40,
    monAmmount: 56.90,
    tueAmmount: 30.40,
    wedAmmount: 43.20,
    thuAmmount: 24.49,
    friAmmount: 100.34,
    satAmmount: 30.53,
  );

  void updateMyBarData(List<double> newData) {
    // Periksa apakah nilai baru melebihi maxY
    if (newData.any((value) => value > maxY.value)) {
      // Jika iya, atur nilai maxY ke nilai terbesar newData
      maxY.value = newData.reduce((value, element) => value > element ? value : element);
    }
    // Set nilai newData ke mybardata
    mybarData.sunAmmount = newData[0];
    update(); // Memperbarui tampilan
  }

  @override
  void onInit() {
    super.onInit();
    mybarData.initializeBarData();
    dropdownValue.value = "Pemasukan";
    getProfile();
  }
}
