import 'dart:ffi';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tatarupiah/app/data/api/profile_service.dart';

import '../../../routes/app_pages.dart';

class ProfileController extends GetxController {
  RxString img = ''.obs;
  RxString name = ''.obs;
  RxString storeName = ''.obs;
  RxString email = ''.obs;
  RxString phone = ''.obs;
  RxString address = ''.obs;
  RxBool isEdit = false.obs;
  RxBool obsecureText = true.obs;
  Rx<DateTime> creadtedAt = DateTime.now().obs;

  Future<void> fetchProfile() async {
    final profileService = ProfileService();
    await profileService.getUser().then((value) {
      img.value = value.data.image;
      name.value = value.data.nama;
      storeName.value = value.data.namaToko;
      email.value = value.data.email;
      phone.value = value.data.noHandphone;
      address.value = value.data.alamat;
      creadtedAt.value = value.data.createdAt;
    });
  }

  void changeName(String value) {
    name.value = value;
  }

  void changeStoreName(String value) {
    storeName.value = value;
  }

  void changeEmail(String value) {
    email.value = value;
  }

  void changePhone(String value) {
    phone.value = value;
  }

  void changeEdit() {
    isEdit.value = !isEdit.value;
  }

  navigatedToEditProfile() {
    Get.toNamed(Routes.EDITPROFILE);
  }

  @override
  void onInit() {
    fetchProfile();
    super.onInit();
  }

  Future<void> updateProfile() async {
    print(name.value);
    final profileService = ProfileService();
    await profileService.postProfile(
      name: name.value,
      email: email.value,
      storeName: storeName.value,
      phone: phone.value,
      address: address.value,
    );
    isEdit.value = !isEdit.value;
    Get.back();
    fetchProfile();
    Get.offAllNamed(Routes.PROFILE);
  }

  void logout() {
    GetStorage().erase;
    Get.offAllNamed(Routes.ONBOARDING);
  }
}
