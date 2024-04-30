import 'package:get/get.dart';
import 'package:tatarupiah/app/data/api/auth_service.dart';
import 'package:tatarupiah/app/models/user_model.dart';
import 'package:tatarupiah/app/modules/auth/controllers/auth_controller.dart';
import 'package:tatarupiah/app/routes/app_pages.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController
  Rx<UserModel> userProfile = UserModel(
    nama: 'dimassalah',
    email: 'dimassalah10@gmail.com',
    namaToko: 'Kedai ABC',
    noHandphone: '081902652049',
    alamat: 'Jl. Timoho no.12',
  ).obs;

  final AuthController authController = Get.find();

  @override
  void onInit() {
    super.onInit();
    fetchUserProfile();
  }

  // Metode untuk mengambil data pengguna setelah login
  void fetchUserProfile() {
    UserModel user = authController.user.value;
    updateUserProfile(user);
  }

  // Metode untuk memperbarui data pengguna
  void updateUserProfile(UserModel updatedUser) {
    userProfile.value = updatedUser;
  }

  void getToEditProfile() {
    Get.toNamed(Routes.EDITPROFILE);
  }

  void getToAuth() {
    Get.toNamed(Routes.AUTH);
  }
}
