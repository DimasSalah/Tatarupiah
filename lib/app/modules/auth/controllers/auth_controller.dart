import 'package:get/get.dart';
import 'package:tatarupiah/app/data/api/auth_service.dart';
import 'package:tatarupiah/app/models/user_model.dart';
import 'package:tatarupiah/app/routes/app_pages.dart';

class AuthController extends GetxController {
  // Variabel untuk menyimpan nilai input dari form
  RxString email = ''.obs;
  RxString password = ''.obs;
  RxString name = ''.obs;
  // Variabel untuk menyimpan pesan kesalahan validasi
  var emailError = RxString('');
  var passwordError = RxString('');
  // Variabel untuk menyimpan data pengguna setelah login
  Rx<UserModel> user = Rx<UserModel>(UserModel(
      nama: ' ', email: ' ', namaToko: ' ', noHandphone: ' ', alamat: ' '));

  // Fungsi untuk mengubah nilai input form
  void onEmailChanged(String value) {
    email.value = value;
  }

  //
  void onPasswordChanged(String value) {
    password.value = value;
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

// Fungsi untuk navigasi ke halaman pendaftaran
  void navigationToRegister() {
    Get.toNamed(Routes.REGISTER);
  }

  Future<void> login() async {
    final authService = AuthService();
    authService.login(email.value, password.value);
    final userData = await authService.login(email.value, password.value);
    // Simpan data pengguna ke dalam variabel user
    user.value = userData as UserModel;
  }

  var validator;

  // // Fungsi untuk mengirim data pendaftaran dan melakukan validasi
  // void register() {
  //   if (!validateEmail()) return;
  //   if (!validatePassword()) return;

  //   // Setelah pendaftaran berhasil, navigasikan pengguna ke halaman login
  //   Get.toNamed(Routes.AUTH);
  // }

// Metode untuk mendapatkan data pengguna
  UserModel getCurrentUser() {
    return user.value;
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
}
