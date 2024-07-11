import 'dart:io';
import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tatarupiah/app/data/services/profile_service.dart';

import '../../../utils/global_controller/user_controller.dart';
import '../../../routes/app_pages.dart';
import '../views/componnets/loading_circular.dart';

class ProfileController extends GetxController {
  RxBool isEdit = false.obs;
  RxBool obsecureText = true.obs;
  RxBool obsecureText2 = true.obs;
  RxBool isLoading = false.obs;
  Rx<File?> filepath = Rx<File?>(null);

  final profileService = ProfileService();
  final UserController userController = UserController.to;
  final formKeyPassword = GlobalKey<FormState>();

  //edit profile text controller
  final TextEditingController nameC = TextEditingController();
  final TextEditingController storeNameC = TextEditingController();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController phoneC = TextEditingController();
  final TextEditingController addressC = TextEditingController();

  //change password text controller
  final TextEditingController oldPasswordC = TextEditingController();
  final TextEditingController newPasswordC = TextEditingController();
  final TextEditingController confirmPasswordC = TextEditingController();

  void _initializeTextEditingControllers() {
    nameC.text = userController.nameProfile.value;
    storeNameC.text = userController.storeNameProfile.value;
    emailC.text = userController.emailProfile.value;
    phoneC.text = userController.phoneProfile.value;
    addressC.text = userController.addressProfile.value;
  }

  validateEmail(String? email) {
    if (email != null && !GetUtils.isEmail(email)) {
      return 'Email tidak valid';
    }
    return null;
  }

  validatePassword(String? pwd) {
    if (pwd!.length < 6) {
      return 'Password minimal 6 karakter';
    }
    return null;
  }

  // Future<bool> reqPerStorage(Permission permission) async {
  //   AndroidDeviceInfo build = await DeviceInfoPlugin().androidInfo;
  //   if (build.version.sdkInt! >= 30) {
  //     var req = await Permission.manageExternalStorage.request();
  //     if (req.isGranted) {
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } else {
  //     if (await permission.isGranted) {
  //       return true;
  //     } else {
  //       var ressult = await permission.request();
  //       if (ressult.isGranted) {
  //         return true;
  //       } else {
  //         return false;
  //       }
  //     }
  //   }
  // }

  // pic file from gallery
  void pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
    );
    if (result != null) {
      filepath.value = File(result.files.single.path!);
    }
    await changeImage();
    userController.fetchProfile();
  }

  //pic file from camera
  void captureImage() async {
    var imageReq = await Permission.camera.request();
    if (imageReq.isGranted) {
      final result = await ImagePicker().pickImage(source: ImageSource.camera);
      if (result != null) {
        filepath.value = File(result.path);
      }
      await changeImage();
      userController.fetchProfile();
    } else {
      Get.snackbar('Error', 'Permission denied');
    }
  }

  Future<void> changeImage() async {
    await profileService.updateImage(image: filepath.value);
    Get.back();
    Get.snackbar('Success', 'Gambar berhasil diubah', colorText: Colors.green);
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

  Future<void> changePassword() async {
    if (newPasswordC.text != confirmPasswordC.text) {
      Get.snackbar('Error', 'Password tidak sama');
    } else if (formKeyPassword.currentState!.validate()) {
      try {
        Get.dialog(
          const LoadingCircular(),
        );
        await profileService.changePassword(
          oldPassword: oldPasswordC.text,
          newPassword: newPasswordC.text,
          confirmPassword: confirmPasswordC.text,
        );
        Get.back();
        oldPasswordC.clear();
        newPasswordC.clear();
        confirmPasswordC.clear();
        Future.delayed(const Duration(seconds: 1), () {
          Get.snackbar('Success', 'Password berhasil diubah',
              colorText: Colors.green);
        });
        Get.back();
      } catch (e) {
        Get.back();
        Get.snackbar('Error', 'Password lama salah');
      }
    }
  }

  void logout() async {
    await GetStorage().erase();
    Get.offAllNamed(Routes.AUTH);
  }

  @override
  void onInit() {
    _initializeTextEditingControllers();
    super.onInit();
  }
}
