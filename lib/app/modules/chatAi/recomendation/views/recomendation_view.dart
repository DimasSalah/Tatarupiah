import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tatarupiah/app/modules/chatAi/assistant/views/component/container_custom.dart';
import 'package:tatarupiah/app/style/colors.dart';
import 'package:tatarupiah/app/style/text_style.dart';
import '../controllers/recomendation_controller.dart';

class RecomendationView extends GetView<RecomendationController> {
  const RecomendationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/arrow_left.svg',
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'Ai rekomendasi',
          style: semiBold.copyWith(fontSize: 20),
        ),
      ),
      body: GetBuilder<RecomendationController>(
          id: 'chat',
          builder: (controller) {
            return DashChat(
              currentUser: controller.currentUser,
              typingUsers: controller.typingUsers,
              messageOptions: MessageOptions(currentUserContainerColor: normal),
              onSend: (ChatMessage m) {
                controller.getChatResponse(m);
              },
              messages: controller.messagesList,
            );
          }),
    );
  }
}
