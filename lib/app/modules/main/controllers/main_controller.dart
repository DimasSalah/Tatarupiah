import 'package:get/get.dart';
import 'package:tatarupiah/app/modules/chatAi/views/chat_ai_view.dart';
import 'package:tatarupiah/app/modules/home/views/home_view.dart';
import 'package:tatarupiah/app/modules/statistics/views/statistics_view.dart';

import '../../../routes/app_pages.dart';

class MainController extends GetxController {
  RxInt selectedIndex = 0.obs;

  final screen = [
    HomeView(),
    StatisticsView(),
    ChatAiView()
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  
}
