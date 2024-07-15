import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../style/colors.dart';
import '../../../../style/text_style.dart';
import '../controllers/assistant_controller.dart';
import 'component/bottom_chat.dart';
import 'component/initial_message.dart';

class AssistantView extends GetView<AssistantController> {
  const AssistantView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AssistantView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  InitialMessage(
                    onChanged: controller.setAmount,
                  ),
                  const SizedBox(height: 4),
                  GetBuilder<AssistantController>(
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
