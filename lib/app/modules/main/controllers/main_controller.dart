import 'package:get/get.dart';
import 'package:tatarupiah/app/modules/chatAi/views/chat_ai_view.dart';
import 'package:tatarupiah/app/modules/home/views/home_view.dart';
import 'package:tatarupiah/app/modules/statistics/views/statistics_view.dart';

class MainController extends GetxController {
  RxInt selectedIndex = 2.obs;

  final screen = [
    const HomeView(),
    const StatisticsView(),
    const ChatAiView(),
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
