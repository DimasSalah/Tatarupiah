import 'dart:math';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:tatarupiah/app/style/colors.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(List<ConnectivityResult> results) {
    ConnectivityResult result = results.first;
    if (result == ConnectivityResult.none) {
      Get.snackbar(
        'Koneksi Internet',
        'Tidak ada koneksi internet',
        duration: const Duration(seconds: 10),
      );
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
      }
    }
  }

  GetSnackBar getSnackBar(String title, String message) {
    return GetSnackBar(
      title: title,
      message: message,
      duration: const Duration(seconds: 7),
      backgroundColor: error,
    );
  }
}
