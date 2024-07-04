import 'package:get/get.dart';
import 'package:tatarupiah/app/data/api/profile_service.dart';

import '../../../routes/app_pages.dart';

class ProfileController extends GetxController {
  RxString name = ''.obs;
  RxString storeName = ''.obs;
  RxString email = ''.obs;
  RxString phone = ''.obs;
  RxString address = ''.obs;
  Rx<DateTime> creadtedAt = DateTime.now().obs;


  Future<void> fetchProfile() async {
    final profileService = ProfileService();
    await profileService.getUser().then((value) {
      name.value = value.data.nama;
      storeName.value = value.data.namaToko;
      email.value = value.data.email;
      phone.value = value.data.noHandphone;
      address.value = value.data.alamat;
      creadtedAt.value = value.data.createdAt;
    });
  }

  navigatedToEditProfile() {
    Get.toNamed(Routes.EDITPROFILE);
  }

  @override
  void onReady() {
    fetchProfile();
    super.onReady();
  }
}
