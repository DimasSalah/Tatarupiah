import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tatarupiah/app/data/services/profile_service.dart';

import '../../../data/mixins/user_controller.dart';
import '../../../routes/app_pages.dart';
import '../views/componnets/loading_circular.dart';

class ProfileController extends GetxController {
  RxBool isEdit = false.obs;
  RxBool obsecureText = true.obs;
  RxBool isLoading = false.obs;

  final profileService = ProfileService();
  final UserController userController = UserController.to;

  final TextEditingController nameC = TextEditingController();
  final TextEditingController storeNameC = TextEditingController();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController phoneC = TextEditingController();
  final TextEditingController addressC = TextEditingController();

  void _initializeTextEditingControllers() {
    // Assuming UserController has properties like userName, userStoreName, userEmail, userPhone, userAddress
    nameC.text = userController.nameProfile.value;
    storeNameC.text = userController.storeNameProfile.value;
    emailC.text = userController.emailProfile.value;
    phoneC.text = userController.phoneProfile.value;
    addressC.text = userController.addressProfile.value;
  }

  // void changeName(String value) {
  //   nameProfile.value = value;
  // }

  // void changeStoreName(String value) {
  //   storeNameProfile.value = value;
  // }

  // void changeEmail(String value) {
  //   emailProfile.value = value;
  // }

  // void changePhone(String value) {
  //   phoneProfile.value = value;
  // }

  // void changeAddress(String value) {
  //   addressProfile.value = value;
  // }

  navigatedToEditProfile() {
    Get.toNamed(Routes.EDITPROFILE);
  }

  Future<void> updateProfile() async {
    try {
      Get.dialog(
        const LoadingCircular(),
      );
      await profileService.postProfile(
        name: nameC.text,
        email: emailC.text,
        storeName: storeNameC.text,
        phone: phoneC.text,
        address: addressC.text,
      );
      Get.back();
    } catch (e) {
      Get.back();
      Get.snackbar('Error', e.toString());
    }
  }

  void logout() {
    GetStorage().erase;
    Get.offAllNamed(Routes.ONBOARDING);
  }

  @override
  void onInit() {
    _initializeTextEditingControllers();
    super.onInit();
  }
}
