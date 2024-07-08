import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tatarupiah/app/modules/chatAi/recomendation/views/component/container_custom.dart';
import 'package:tatarupiah/app/style/colors.dart';
import 'package:tatarupiah/app/style/gradient.dart';
import 'package:tatarupiah/app/style/text_style.dart';
import '../controllers/recomendation_controller.dart';
import 'component/bottom_chat.dart';
import 'component/initial_message.dart';

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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  InitialMessage(
                    initialValue: '100000',
                    onChanged: controller.setAmount,
                  ),
                  const SizedBox(height: 4),
                  GetBuilder<RecomendationController>(
                    id: 'chat',
                    builder: (controller) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.conversation.length,
                        itemBuilder: (context, index) {
                          var convo = controller.conversation[index];
                          return Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 23, vertical: 1),
                                alignment: convo.isMe
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: convo.isMe ? normal : light,
                                    borderRadius: BorderRadius.only(
                                      topLeft: const Radius.circular(15),
                                      topRight: const Radius.circular(15),
                                      bottomLeft: convo.isMe
                                          ? const Radius.circular(15)
                                          : const Radius.circular(0),
                                      bottomRight: convo.isMe
                                          ? const Radius.circular(0)
                                          : const Radius.circular(15),
                                    ),
                                  ),
                                  child: Text(convo.text,
                                      style: regular.copyWith(
                                          fontSize: 14,
                                          color: convo.isMe
                                              ? Colors.white
                                              : dark)),
                                ),
                              ),
                              // create for me avatar and gpt avatar
                              Container(
                                padding: const EdgeInsets.all(4),
                                margin: const EdgeInsets.only(bottom: 8),
                                alignment: convo.isMe
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                                decoration: const BoxDecoration(),
                                child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: normal,
                                    child: convo.isMe
                                        ? ClipOval(
                                            child: Icon(
                                            Icons.person,
                                            color: Colors.white,
                                            size: 20,
                                          ))
                                        : Image.asset('assets/icons/bot.png')),
                              )
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          BottomChat(controller: controller),
        ],
      ),
    );
  }
}
