import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chat_ai_controller.dart';

class ChatAiView extends GetView<ChatAiController> {
  const ChatAiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatAiView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ChatAiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
