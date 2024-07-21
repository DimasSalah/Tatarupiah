import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tatarupiah/app/modules/statistics/controllers/statistics_controller.dart';
import 'package:tatarupiah/app/utils/global_controller/user_controller.dart';

import '../../../../utils/currency_format.dart';
import '../../recomendation/data/models/chat_model.dart';

class AssistantController extends GetxController {
  final TextEditingController textController = TextEditingController();
  final userController = Get.put(UserController());
  final statisticController = Get.put(StatisticsController());

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
    'sewa',
    'sedekah',
    'dana darurat',
  ].obs;

  RxString amount = '0'.obs;

  void setAmount(String value) {
    amount.value = value;
    print('amount ${amount.value}');
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
    super.onInit();
  }

  @override
  void onClose() {
    textController.dispose();
    statisticController.onClose();
    super.onClose();
  }

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

  String getamount() {
    if (amount.value == '0') {
      amount.value = currencyFormatWithKDouble(
          statisticController.incomeAmount.value.toString());
    } else {
      amount.value = amount.value;
    }
    return amount.value;
  }

  void sendMessage() async {
    print(amount.value);
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
    var response = await openAi
        .onCompletion(
      request: CompleteText(
        prompt:
            'Saya mempunyai uang dengan nominal ${getamount()} , ingin digunakan untuk ${message.value}, berapa alokasi anggaran yang tepat berikan list anggaranya, deskripsikan dengan singkat',
        model: Gpt3TurboInstruct(),
        maxTokens: 500,
      ),
    )
        .catchError((e) {
      Get.snackbar('Error', e.toString());
      return null;
    });
    if (response!.choices.isNotEmpty) {
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
}
