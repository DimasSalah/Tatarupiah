import 'package:get/get.dart';
import '../services/profile_service.dart';

class UserController extends GetxController {
  static UserController get to => Get.find();

  RxString imgProfile = ''.obs;
  RxString nameProfile = ''.obs;
  RxString storeNameProfile = ''.obs;
  RxString emailProfile = ''.obs;
  RxString phoneProfile = ''.obs;
  RxString addressProfile = ''.obs;
  RxString apiKey = ''.obs;
  Rx<DateTime> createdAt = DateTime.now().obs;

  @override
  void onInit() {
    fetchProfile();
    super.onInit();
  }

  Future<void> fetchProfile() async {
    final profileService = ProfileService();
    await profileService.getUser().then((value) {
      imgProfile.value = value.data.image;
      nameProfile.value = value.data.nama;
      storeNameProfile.value = value.data.namaToko;
      emailProfile.value = value.data.email;
      phoneProfile.value = value.data.noHandphone;
      addressProfile.value = value.data.alamat;
      apiKey.value = value.data.key;
      createdAt.value = value.data.createdAt;
    });
  }
}
