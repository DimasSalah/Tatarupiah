import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../style/colors.dart';
import '../../../style/text_style.dart';
import '../controllers/profile_controller.dart';
import 'componnets/CustomTextContainer.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/arrow_left.svg',
            // width: 12,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'Profil Saya',
          style: semiBold.copyWith(fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: dark,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 26, left: 15),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                    ),
                    const SizedBox(
                      width: 36,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() {
                          return Text(
                            controller.name.value,
                            style:
                                semiBold.copyWith(fontSize: 25, color: light),
                          );
                        }),
                        controller.storeName == ''
                            ? Text(
                                'Nama Toko',
                                style: regular.copyWith(
                                    fontSize: 13, color: lightActive),
                              )
                            : Text(
                                controller.storeName.value,
                                style: regular.copyWith(
                                    fontSize: 13, color: lightActive),
                              ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 33,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'Informasi',
                style: medium.copyWith(
                    fontSize: 16,
                    color: dark,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal),
              ),
              GestureDetector(
                onTap: () {
                  print('edit profile');
                  controller.navigatedToEditProfile();
                },
                child: Text('Edit Profile',
                    style: medium.copyWith(fontSize: 13, color: lightActive)),
              ),
            ]),
            const SizedBox(height: 15),
            CustomTextContainer(
              text: controller.phone.string == ''
                  ? 'Nomor Handphone Kosong'
                  : controller.phone.value,
              style: controller.phone.string == ''
                  ? regular.copyWith(fontSize: 13, color: lightActive)
                  : regular.copyWith(fontSize: 13, color: darkHover),
            ),
            const SizedBox(height: 14),
            CustomTextContainer(
              text: controller.email.string == ''
                  ? 'Email Kosong'
                  : controller.email.value,
              style: controller.email.string == ''
                  ? regular.copyWith(fontSize: 13, color: lightActive)
                  : regular.copyWith(fontSize: 13, color: darkHover),
            ),
            const SizedBox(height: 14),
            CustomTextContainer(
              text: controller.address.string == ''
                  ? 'Alamat Kosong'
                  : controller.address.value,
              style: controller.address.string == ''
                  ? regular.copyWith(fontSize: 13, color: lightActive)
                  : regular.copyWith(fontSize: 13, color: darkHover),
            ),
            const SizedBox(height: 280),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: 'Bergabung ',
                  style: regular.copyWith(fontSize: 13, color: lightActive)),
              TextSpan(
                  text: '21 Februari 2024',
                  style: regular.copyWith(fontSize: 13, color: darkHover)),
            ])),
            GestureDetector(
              onTap: () {},
              child: Text('Keluar',
                  style: medium.copyWith(fontSize: 20, color: error)),
            ),
          ],
        ),
      ),
    );
  }
}
