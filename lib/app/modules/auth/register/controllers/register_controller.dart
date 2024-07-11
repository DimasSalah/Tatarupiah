import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tatarupiah/app/routes/app_pages.dart';

import '../../../../data/api/auth_service.dart';
import '../../../../utils/global_controller/user_controller.dart';

class RegisterController extends GetxController {
  // Variabel untuk menyimpan nilai input dari form
  RxString name = ''.obs;
  RxString email = ''.obs;
  RxString password = ''.obs;
  RxString confirmPassword = ''.obs;
  RxString icon = ''.obs;
  RxBool obscureText = true.obs;
  RxBool isLoading = false.obs;

  // Variabel untuk menyimpan pesan kesalahan validasi
  var nameError = RxString('');
  var emailError = RxString('');
  var passwordError = RxString('');
  var confirmPasswordError = RxString('');

  final formKey = GlobalKey<FormState>();
  final authService = AuthService();
  final UserController userController = UserController.to;

  void onNameChanged(String value) {
    name.value = value;
  }

  void onEmailChanged(String value) {
    email.value = value;
  }

  void onPasswordChanged(String value) {
    password.value = value;
  }

  void onConfirmPasswordChanged(String value) {
    confirmPassword.value = value;
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

  Future<void> register() async {
    if (password.value != confirmPassword.value) {
      Get.snackbar('Gagal', 'password tidak sama');
    } else if (formKey.currentState!.validate()) {
      Get.dialog(Dialog(
        child: Container(
          height: 100,
          width: 100,
          alignment: Alignment.center,
          child: const CircularProgressIndicator(),
        ),
      ));
      try {
        await authService.register(
            name.value, email.value, password.value, confirmPassword.value);
        Get.back();
        await userController.fetchProfile();
        Get.offAllNamed(Routes.MAIN);
      } catch (e) {
        Get.back();
        Get.snackbar('Error', e.toString());
        Get.back();
      }
    }
  }

// Fungsi untuk registrasi
  // Future<void> register() async {
  //   final authService = AuthService();
  //   isLoading.value = true;
  //   try {
  //     await authService.register(
  //         name.value, email.value, password.value, confirmPassword.value);
  //   } catch (e) {
  //     print(e);
  //   }
  //   isLoading.value = false;
  //   final bool isSamePassword = password.value == confirmPassword.value;
  //   final bool isValid = EmailValidator.validate(email.value);
  //   authService.register(
  //         name.value, email.value, password.value, confirmPassword.value);
  //   if (!isValid) {
  //     Get.dialog(
  //       AlertDialog(
  //         title: Text('Email tidak valid'),
  //         content: Text('Silahkan masukkan email yang valid'),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Get.back();
  //             },
  //             child: Text('OK'),
  //           ),
  //         ],
  //       ),
  //     );
  //   } else if (!isSamePassword) {
  //     Get.dialog(
  //       AlertDialog(
  //         title: Text('Password tidak sama'),
  //         content: Text('Silahkan masukkan password yang sama'),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Get.back();
  //             },
  //             child: Text('OK'),
  //           ),
  //         ],
  //       ),
  //     );
  //   } else {
  //     authService.register(
  //         name.value, email.value, password.value, confirmPassword.value);
  //   }
  // }

  // Fungsi untuk validasi nama
  bool validateName() {
    if (name.isEmpty) {
      nameError.value = 'Nama harus diisi';
      return false;
    } else {
      nameError.value = '';
      return true;
    }
  }

  // Fungsi untuk validasi password
  // bool validatePassword() {
  //   if (password.isEmpty) {
  //     passwordError.value = 'Password harus diisi';
  //     return false;
  //   } else if (password.value.length < 6) {
  //     passwordError.value = 'Password minimal terdiri dari 6 karakter';
  //     return false;
  //   } else {
  //     passwordError.value = '';
  //     return true;
  //   }
  // }

  // Fungsi untuk validasi konfirmasi password
  bool validateConfirmPassword() {
    if (confirmPassword.isEmpty) {
      confirmPasswordError.value = 'Konfirmasi password harus diisi';
      return false;
    } else if (confirmPassword.value != password.value) {
      confirmPasswordError.value = 'Konfirmasi password tidak sesuai';
      return false;
    } else {
      confirmPasswordError.value = '';
      return true;
    }
  }

  // Fungsi untuk mengosongkan pesan kesalahan validasi
  void clearErrors() {
    nameError.value = '';
    emailError.value = '';
    passwordError.value = '';
    confirmPasswordError.value = '';
  }

  // Fungsi untuk mengosongkan nilai input form
  void clearFields() {
    name.value = '';
    email.value = '';
    password.value = '';
    confirmPassword.value = '';
  }

  void navigationToLogin() {
    Get.offNamed(Routes.AUTH);
  }

  void samePassword() {
    if (password.value != confirmPassword.value) {
      confirmPasswordError.value = 'Password tidak sama';
    } else {
      confirmPasswordError.value = '';
    }
  }

  @override
  void dispose() {
    formKey.currentState;
    super.dispose();
  }
}
