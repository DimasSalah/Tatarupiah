import 'package:get/get.dart';

import '../controllers/chat_ai_controller.dart';

class ChatAiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatAiController>(
      () => ChatAiController(),
    );
  }
}
