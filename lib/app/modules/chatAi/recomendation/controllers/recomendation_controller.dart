import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tatarupiah/app/modules/statistics/controllers/statistics_controller.dart';

import '../../../../utils/global_controller/user_controller.dart';
import '../data/models/chat_model.dart';

class RecomendationController extends GetxController {
  final TextEditingController textController = TextEditingController();
  final UserController userController = UserController.to;
  late OpenAI openAi;

  RxString message = ''.obs;
  RxList<Chat> conversation = <Chat>[].obs;
  RxInt index = 0.obs;
  RxString icon = ''.obs;
  RxList<String> selectedOptions = <String>[].obs;
  RxList<String> options = [
    'investasi',
    'tabungan',
    'kredit',
    'makanan',
    'transportasi',
    'belanja',
    'hiburan',
    'pendidikan',
    'modal usaha',
    'sedekah',
    'dana darurat',
  ].obs;

  RxString amount = '0'.obs;

  void setAmount(String value) {
    amount.value = value;
  }

  // String getamount() {
  //   if (amount.value.isEmpty) {
  //     amount.value = formatCurrency( homeController.totalIncome.value.toString());
  //   } else {
  //     amount.value = amount.value;
  //   }
  //   return amount.value;
  // }

  void toggleOption(String option) {
    //function to toggle option
    if (selectedOptions.contains(option)) {
      selectedOptions.remove(option);
    } else {
      selectedOptions.add(option);
    }
    updateTextField();
  }

  void updateTextField() {
    //function to update text field with selected options
    textController.text = selectedOptions.join(', ');
  }

  bool isSelected(String option) {
    //function to check if option is selected
    return selectedOptions.contains(option);
  }

  void sendMessage() async {
    message.value = textController.text;
    if (message.string.trim().isEmpty) {
      return;
    }
    conversation.add(
      Chat(
        message.string,
        true,
      ),
    );
    update(['chat']);
    textController.clear();
    var response = await openAi.onCompletion(
      request: CompleteText(
        prompt:
            'Saya mempunyai uang dengan nominal ${amount.value} , ingin digunakan untuk ${message.value}, berapa alokasi anggaran yang tepat berikan list anggaranya, deskripsikan dengan singkat',
        model: Gpt3TurboInstruct(),
        maxTokens: 300,
      ),
    );
    if (response != null && response!.choices.isNotEmpty) {
      conversation.add(
        Chat(
          response.choices.first.text,
          false,
        ),
      );
      print('response ${response.choices.single.text}');
    }
    update(['chat']);
  }

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
