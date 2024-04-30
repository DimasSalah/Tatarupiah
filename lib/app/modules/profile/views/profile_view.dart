import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../style/colors.dart';
import '../../../style/text_style.dart';
import '../controllers/profile_controller.dart';
import 'componnets/CustomTextContainer.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({Key? key}) : super(key: key);
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
                          'Toko',
                          style: semiBold.copyWith(fontSize: 25, color: light),
                        ),
                        Text('Nama',
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
                onTap: () {},
                child: Text('Edit Profile',
                    style: medium.copyWith(fontSize: 13, color: lightActive)),
              ),
            ]),
            SizedBox(height: 15),
            CustomTextContainer(
              text: 'Nama',
            ),
            SizedBox(height: 14),
            CustomTextContainer(
              text: 'email',
            ),
            SizedBox(height: 14),
            CustomTextContainer(
              text: 'No Handphone',
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
