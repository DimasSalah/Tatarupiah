import 'package:get/get.dart';

import '../../../utils/global_controller/user_controller.dart';

class ChatAiController extends GetxController {
  //TODO: Implement ChatAiController
  final UserController userController = UserController.to;

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
}
