import 'package:get/get.dart';
import 'package:tatarupiah/app/modules/chatAi/controllers/chat_ai_controller.dart';
import 'package:tatarupiah/app/modules/home/controllers/home_controller.dart';

import '../../statistics/controllers/statistics_controller.dart';
import '../controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(
      () => MainController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<StatisticsController>(
      () => StatisticsController(),
    );
    Get.lazyPut<ChatAiController>(
      () => ChatAiController(),
    );
  }
}
