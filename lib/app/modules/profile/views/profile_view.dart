import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:tatarupiah/app/modules/profile/views/componnets/CustomTextContainer.dart';
import 'package:tatarupiah/app/routes/app_pages.dart';
import 'package:tatarupiah/app/style/colors.dart';
import 'package:tatarupiah/app/style/text_style.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
                    CircleAvatar(
                      radius: 50,
                    ),
                    SizedBox(
                      width: 36,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'dimassalah',
                          style: semiBold.copyWith(fontSize: 25, color: light),
                        ),
                        Text('Kedai ABC',
                            style: medium.copyWith(fontSize: 16, color: light)),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
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
                onTap: () => Get.offAllNamed(Routes.EDITPROFILE),
                child: Text('Edit Profile',
                    style: medium.copyWith(fontSize: 13, color: lightActive)),
              ),
            ]),
            SizedBox(height: 15),
            CustomTextContainer(
              text: '081902652049',
            ),
            SizedBox(height: 14),
            CustomTextContainer(
              text: 'dimassalah10@gmail.com',
            ),
            SizedBox(height: 14),
            CustomTextContainer(
              text: 'Jl. Timoho no.12',
            ),
            SizedBox(height: 280),
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
              onTap: () => Get.offAllNamed(Routes.EDITPROFILE),
              child: Text('Keluar',
                  style: medium.copyWith(fontSize: 20, color: error)),
            ),
          ],
        ),
      ),
    );
  }
}
