import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import 'package:tatarupiah/app/routes/app_pages.dart';
import 'package:tatarupiah/app/style/colors.dart';
import 'package:tatarupiah/app/style/text_style.dart';

import '../../home/views/components/header_bar.dart';
import '../controllers/chat_ai_controller.dart';

class ChatAiView extends GetView<ChatAiController> {
  const ChatAiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Obx(
                () => HeaderBar(
                  avatar: controller.userController.imgProfile.string == ''
                      ? 'https://www.tenforums.com/attachments/user-accounts-family-safety/322690d1615743307t-user-account-image-log-user.png'
                      : controller.userController.imgProfile.string,
                  onTap: () {
                    Get.toNamed(Routes.PROFILE);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                    height: 400,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40), color: dark),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 24,
                        right: 24,
                        top: 24,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('AI Assistent.',
                              style:
                                  medium.copyWith(fontSize: 25, color: light)),
                          Center(
                            child: Container(
                              height: 300,
                              width: 500,
                              child: RiveAnimation.asset(
                                'assets/icons/robot_ai.riv',
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
              ),
              const Gap(19),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Column(
                  children: [
                    Text(
                      'Percepat alokasi anggaranmu dengan bantuan Ai',
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: medium.copyWith(fontSize: 20, color: dark),
                    ),
                    Text(
                      'Coba pengalaman baru dengan AI untuk  mengelola dana secara efisien dan hemat waktu',
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: regular.copyWith(fontSize: 13, color: lightActive),
                    ),
                    const Gap(20),
                    InkWell(
                      onTap: () => Get.toNamed(Routes.ASSISTANT),
                      child: Ink(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: light,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: lightActive, width: 1),
                        ),
                        child: Text(
                          textAlign: TextAlign.center,
                          'Alokasikan Anggaran',
                          style:
                              medium.copyWith(color: lightActive, fontSize: 16),
                        ),
                      ),
                    ),
                    const Gap(20),
                    InkWell(
                      onTap: () => Get.toNamed(Routes.RECOMENDATION),
                      child: Ink(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: light,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: lightActive, width: 1),
                        ),
                        child: Text(
                          textAlign: TextAlign.center,
                          'AI Assistent',
                          style:
                              medium.copyWith(color: lightActive, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
