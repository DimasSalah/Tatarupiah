import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/global_controller/user_controller.dart';

class RecomendationController extends GetxController{
  final userController = Get.put(UserController());
  final textController = TextEditingController();

  final List<String> questions = [
    'Bagaimana cara mengatur anggaran bulanan?',
    'Bagaimana cara mengurangi biaya operasional tanpa mengorbankan kualitas',
    'Apa saja indikator keuangan yang harus saya pantau secara rutin?',
    'Apa saja langkah-langkah untuk memaksimalkan keuntungan selama musim ramai dan tetap bertahan di musim sepi?'
  ];

  @override
  void onInit() {
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
        messages: messagesHistory, maxToken: 500, model: GptTurboChatModel());
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

  void sendMessage(String text) {
    final message = ChatMessage(
      user: currentUser,
      createdAt: DateTime.now(),
      text: text,
    );
    getChatResponse(message);
    textController.clear();
  }
}
