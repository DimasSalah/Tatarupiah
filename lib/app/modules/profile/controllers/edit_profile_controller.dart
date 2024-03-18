import 'package:get/get.dart';
import 'package:tatarupiah/app/routes/app_pages.dart';

class EditProfileController extends GetxController {
  //TODO: Implement ProfileController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void getToProfile() {
    Get.toNamed(Routes.PROFILE);
  }
}
