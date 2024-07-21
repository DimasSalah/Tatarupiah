import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
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
        actions: [
          IconButton(
            onPressed: () {
              _showQuestionsDialog(context);
            },
            icon: Icon(
              Icons.info_outline,
              color: normal,
            ),
          ),
        ],
      ),
      body: GetBuilder<RecomendationController>(
        id: 'chat',
        builder: (controller) {
          return DashChat(
            currentUser: controller.currentUser,
            typingUsers: controller.typingUsers,
            messageOptions: MessageOptions(
              currentUserContainerColor: normal,
            ),
            onSend: (ChatMessage m) {
              controller.getChatResponse(m);
            },
            messages: controller.messagesList,
            inputOptions: InputOptions(
              inputToolbarPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              inputDecoration: InputDecoration(
                hintText: 'Type a message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              textController: controller.textController,
              alwaysShowSend: true,
            ),
          );
        },
      ),
    );
  }

  void _showQuestionsDialog(BuildContext context) {
    final controller = Get.find<RecomendationController>();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: light,
          surfaceTintColor: light,
          scrollable: true,
          title: Text(
            'Pilih Pertanyaan',
            style: medium.copyWith(
              fontSize: 20,
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: controller.questions.map((question) {
                return ListTile(
                  title: Text(
                    question,
                    style: regular.copyWith(fontSize: 13),
                  ),
                  onTap: () {
                    controller.textController.text = question;
                    Get.back();
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
