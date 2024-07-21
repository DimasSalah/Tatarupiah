import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import 'package:tatarupiah/app/routes/app_pages.dart';
import 'package:tatarupiah/app/style/colors.dart';
import 'package:tatarupiah/app/style/text_style.dart';

import '../../../style/gradient.dart';
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
                              child: const RiveAnimation.asset(
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
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          color: normal,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: normal.withOpacity(0.4), width: 2),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            )
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () => Get.toNamed(Routes.ASSISTANT),
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  decoration: BoxDecoration(
                                    gradient: primary,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: SvgPicture.asset(
                                    'assets/icons/funds.svg',
                                    width: 20,
                                  ),
                                ),
                                Text(
                                  'Anggaran',
                                  style: medium.copyWith(
                                      fontSize: 15, color: white),
                                ),
                              ],
                            ),
                          ),
                          VerticalDivider(
                            color:
                                error, // Assuming 'light' is defined elsewhere as a Color
                            thickness: 5,
                            width:
                                20, // Adjust the width to create space around the divider
                          ),
                          GestureDetector(
                            onTap: () => Get.toNamed(Routes.RECOMENDATION),
                            child: Column(
                              children: [
                                Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    decoration: BoxDecoration(
                                      gradient: primary,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: SvgPicture.asset(
                                      'assets/icons/assistant.svg',
                                      width: 20,
                                    )),
                                Text(
                                  'services',
                                  style: medium.copyWith(
                                      fontSize: 15, color: white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(20)
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
