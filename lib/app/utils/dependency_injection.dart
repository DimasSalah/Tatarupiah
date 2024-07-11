import 'package:get/get.dart';
import 'package:tatarupiah/app/utils/global_controller/network_controller.dart';

import 'global_controller/user_controller.dart';

class DependencyInjection {
  static void init() {
    Get.put<UserController>(UserController(), permanent: true);
    Get.put<NetworkController>(NetworkController(), permanent: true);
  }
}
