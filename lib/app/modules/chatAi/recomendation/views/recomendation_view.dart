import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/recomendation_controller.dart';

class RecomendationView extends GetView<RecomendationController> {
  const RecomendationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RecomendationView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RecomendationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
