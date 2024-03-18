import 'package:get/get.dart';
import 'package:tatarupiah/app/modules/profile/controllers/edit_profile_controller.dart';

import '../controllers/profile_controller.dart';

class EditProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfileController>(
      () => EditProfileController(),
    );
  }
}