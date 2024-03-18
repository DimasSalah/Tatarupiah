import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tatarupiah/app/modules/profile/views/componnets/CustomTextContainer.dart';
import 'package:tatarupiah/app/style/colors.dart';

import '../controllers/profile_controller.dart';

class EditProfileView extends GetView<ProfileController> {
  const EditProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        // centerTitle: true,
      ),
      body: Column(
        children: [
          CircleAvatar(
            radius: 50,
          ),
        ],
      ),
    );
  }
}
