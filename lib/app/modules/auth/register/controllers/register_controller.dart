import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tatarupiah/app/data/api/auth_service.dart';
import 'package:tatarupiah/app/routes/app_pages.dart';

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

// Fungsi untuk registrasi
  Future<void> register() async {
    final authService = AuthService();
    isLoading.value = true;
    try {
      await authService.register(
          name.value, email.value, password.value, confirmPassword.value);
      print(isLoading.value);
    } catch (e) {
      print(e);
    }
    print(isLoading.value);
    isLoading.value = false;
    print(name.value);
    print(email.value);
    print(password.value);
    print('confirm password: ${confirmPassword.value}');
    final bool isSamePassword = password.value == confirmPassword.value;
    final bool isValid = EmailValidator.validate(email.value);
    if (!isValid) {
      Get.dialog(
        AlertDialog(
          title: Text('Email tidak valid'),
          content: Text('Silahkan masukkan email yang valid'),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    } else if (!isSamePassword) {
      Get.dialog(
        AlertDialog(
          title: Text('Password tidak sama'),
          content: Text('Silahkan masukkan password yang sama'),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    } else {
      authService.register(
          name.value, email.value, password.value, confirmPassword.value);
      Get.offNamed(Routes.HOME);
    }
  }

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
    Get.toNamed(Routes.AUTH);
  }

  void samePassword() {
    if (password.value != confirmPassword.value) {
      confirmPasswordError.value = 'Password tidak sama';
    } else {
      confirmPasswordError.value = '';
    }
  }
}
