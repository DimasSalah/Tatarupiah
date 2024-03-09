import 'package:get/get.dart';
import 'package:tatarupiah/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController

  // Variabel untuk menyimpan nilai input dari form
  var name = ''.obs;
  var email = ''.obs;
  var password = ''.obs;
  var confirmPassword = ''.obs;

  // Variabel untuk menyimpan pesan kesalahan validasi
  var nameError = RxString('');
  var emailError = RxString('');
  var passwordError = RxString('');
  var confirmPasswordError = RxString('');

  var validator;

  // Fungsi untuk mengirim data pendaftaran dan melakukan validasi
  void register() {
    if (!validateName()) return;
    if (!validateEmail()) return;
    if (!validatePassword()) return;
    if (!validateConfirmPassword()) return;

    // Setelah pendaftaran berhasil, navigasikan pengguna ke halaman login
    Get.toNamed(Routes.AUTH);
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
  void navigationToLogin() {
    Get.toNamed(Routes.AUTH);
  }

  void navigationToRegister() {
    Get.toNamed(Routes.REGISTER);
  }
}
