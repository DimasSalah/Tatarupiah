import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/models/chat_model.dart';

class RecomendationController extends GetxController {
  final TextEditingController textController = TextEditingController();
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
  ].obs;

  RxString amount = ''.obs;

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
  
  void toggleOption(String option) { //function to toggle option
    if (selectedOptions.contains(option)) {
      selectedOptions.remove(option);
    } else {
      selectedOptions.add(option);
    }
    updateTextField();
  }

  void updateTextField() { //function to update text field with selected options
    textController.text = selectedOptions.join(', ');
  }
  
  bool isSelected(String option) { //function to check if option is selected
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
        prompt: 'Saya mempunyai 100000, ingin digunakan untuk ${message.value}, berapa alokasi anggaran yang tepat?, deskripsikan dengan sangat singkat',
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
    print('onInit called');
    openAi = OpenAI.instance.build(
      token: '',
      baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 5)),
      enableLog: true,
    );
    super.onInit();
  }
}
