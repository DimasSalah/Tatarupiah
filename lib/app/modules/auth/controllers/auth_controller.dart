import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tatarupiah/app/data/api/auth_service.dart';
import 'package:tatarupiah/app/data/models/user_model.dart';
import 'package:tatarupiah/app/routes/app_pages.dart';

class AuthController extends GetxController {
  // Variabel untuk menyimpan nilai input dari form
  RxString email = ''.obs;
  RxString password = ''.obs;
  RxString name = ''.obs;
  RxString icon = ''.obs;
  RxBool obscureText = true.obs;
  RxBool isLoading = false.obs;
  // Variabel untuk menyimpan pesan kesalahan validasi
  var emailError = RxString('');
  var passwordError = RxString('');
  // Variabel untuk menyimpan data pengguna setelah login

  // Fungsi untuk mengubah nilai input form
  void onEmailChanged(String value) {
    email.value = value;
  }

  void onPasswordChanged(String value) {
    password.value = value;
  }

  // Fungsi untuk mengosongkan pesan kesalahan validasi
  void clearErrors() {
    emailError.value = '';
    passwordError.value = '';
  }

  void clearFields() {
    email.value = '';
    password.value = '';
  }

// Fungsi untuk navigasi ke halaman pendaftaran

// Fungsi untuk login
  Future<void> login() async {
    final authService = AuthService();
    isLoading.value = true;
    try {
      await authService.login(email.value, password.value);
      print(isLoading.value);
    } catch (e) {
      print(e);
    }
    print(isLoading.value);
    isLoading.value = false;
    final bool isValid = EmailValidator.validate(email.value);
    if (!isValid) {
      Get.dialog(
        AlertDialog(
          title: const Text('Error'),
          content: const Text('Email tidak valid'),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } else if (!isValid) {
      final bool isValid = validatePassword();
      Get.dialog(
        AlertDialog(
          title: const Text('Error'),
          content: const Text('Password tidak valid'),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  var validator;

  // Fungsi untuk validasi email
  bool validateEmail() {
    if (email.isEmpty) {
      emailError.value = 'Email harus diisi';
      return false;
    } else if (!validator.isEmail(email.value)) {
      emailError.value = 'Format email tidak valid';
      return false;
    } else {
      emailError.value = '';
      return true;
    }
  }

  // Fungsi untuk validasi password
  bool validatePassword() {
    if (password.isEmpty) {
      passwordError.value = 'Password harus diisi';
      return false;
    } else if (password.value.length < 6) {
      passwordError.value = 'Password minimal terdiri dari 6 karakter';
      return false;
    } else {
      passwordError.value = '';
      return true;
    }
  }
}
