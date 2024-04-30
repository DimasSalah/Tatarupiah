import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tatarupiah/app/data/api/profile_service.dart';
import 'package:tatarupiah/app/models/user_model.dart';
import 'package:tatarupiah/app/routes/app_pages.dart';

class EditProfileController extends GetxController {
  final ProfileService profileService = Get.find();

  Future<void> updateUserProfile(UserModel user) async {
    // Implement your logic to update user profile in the database
    try {
      await profileService.updateUserProfile(user);

      // Menampilkan AlertDialog jika data berhasil disimpan
      showDialog(
        context: Get.context!,
        builder: (context) => AlertDialog(
          title: Text('Success'),
          content: Text('Profile updated successfully'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );

      // Menampilkan nilai yang dikirim ke console
      print(user);

      Get.offNamed(Routes.PROFILE);
    } catch (e) {
      // Menampilkan pesan error jika terjadi kesalahan
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

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
