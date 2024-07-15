import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tatarupiah/app/modules/statistics/controllers/statistics_controller.dart';

import '../../../../utils/global_controller/user_controller.dart';
import '../data/models/chat_model.dart';

class RecomendationController extends GetxController {
 
  final userController = Get.put(UserController());

  @override
  void onInit() {
    // print('harga ${staticController.incomeAmount.value.toString()}');
    // String incomeAmountString = staticController.incomeAmount.value.toString();
    // incomeAmountString = amount.value;
    openAi = OpenAI.instance.build(
      token: userController.apiKey.value,
      baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 5)),
      enableLog: true,
    );
    sendInitialMessage();
    super.onInit();
  }

  final ChatUser currentUser = ChatUser(
    id: '1',
    firstName: 'User',
  );
  final ChatUser gptUser = ChatUser(
    id: '2',
    firstName: 'AI',
  );

  RxList<ChatMessage> messagesList = <ChatMessage>[].obs;
  List<ChatUser> typingUsers = <ChatUser>[].obs;
  late OpenAI openAi;

  Future<void> getChatResponse(ChatMessage m) async {
    messagesList.insert(0, m);
    typingUsers.add(gptUser);
    update(['chat']);
    List<Map<String, dynamic>> messagesHistory = messagesList.reversed.map((m) {
      if (m.user == currentUser) {
        return {'role': "user", 'content': m.text};
      } else {
        return {
          'role': "user",
          'content':
              '${m.text} note: fokus pada karakter awal yang dapat membantu mengalokasikan anggaran dengan membuatkan nya list, Jika ada pertanyaan di luar manajemen keuangan, seperti nama tokoh ataupun lainya jawab dengan "itu bukan kapasitas saya untuk menjawab"., berikan response dengan jawab yang singkat dan jelas dengan maksimal 200 token'
        };
      }
    }).toList();
    final request = ChatCompleteText(
        messages: messagesHistory, maxToken: 200, model: GptTurboChatModel());
    final response = await openAi.onChatCompletion(request: request);
    for (var element in response!.choices) {
      if (element.message != null) {
        messagesList.insert(
            0,
            ChatMessage(
                user: gptUser,
                createdAt: DateTime.now(),
                text: element.message!.content));
        update(['chat']);
      }
    }
    typingUsers.remove(gptUser);
  }

  Future<void> sendInitialMessage() async {
    final initialMessage = ChatMessage(
      user: currentUser,
      createdAt: DateTime.now(),
      text:
          "hai siapa kamu .note: kamu adalah aplikasi Tatarupiah yang dapat membantu mengalokasikan anggaran, jika  saya memberi pertanyaan bukan tentang berbau management keuangan jawab itu bukan kapasitas saya untuk menjawab",
    );

    List<Map<String, dynamic>> messagesHistory = [
      {'role': "user", 'content': initialMessage.text}
    ];

    final request = ChatCompleteText(
        messages: messagesHistory, maxToken: 200, model: GptTurboChatModel());

    final response = await openAi.onChatCompletion(request: request);

    for (var element in response!.choices) {
      if (element.message != null) {
        messagesList.insert(
            0,
            ChatMessage(
                user: gptUser,
                createdAt: DateTime.now(),
                text: element.message!.content));
        update(['chat']);
      }
    }
  }
}
