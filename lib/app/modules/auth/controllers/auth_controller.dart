import 'package:get/get.dart';
import 'package:tatarupiah/app/routes/app_pages.dart';

class AuthController extends GetxController {
  //TODO: Implement AuthController

  // Variabel untuk menyimpan nilai input dari form
  var email = ''.obs;
  var password = ''.obs;

  // Variabel untuk menyimpan pesan kesalahan validasi
  var emailError = RxString('');
  var passwordError = RxString('');

  var validator;

  // Fungsi untuk mengirim data pendaftaran dan melakukan validasi
  void register() {
    if (!validateEmail()) return;
    if (!validatePassword()) return;

    // Setelah pendaftaran berhasil, navigasikan pengguna ke halaman login
    Get.toNamed(Routes.AUTH);
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

  // Fungsi untuk mengosongkan pesan kesalahan validasi
  void clearErrors() {
    emailError.value = '';
    passwordError.value = '';
  }

  // Fungsi untuk mengosongkan nilai input form
  void clearFields() {
    email.value = '';
    password.value = '';
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

  void navigationToRegister() {
    Get.toNamed(Routes.REGISTER);
  }
}
