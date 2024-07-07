import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import '../../../routes/app_pages.dart';
import '../../../style/colors.dart';
import '../../../style/text_style.dart';
import '../controllers/profile_controller.dart';
import 'componnets/CustomTextContainer.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                      backgroundImage: NetworkImage(
                        controller.userController.imgProfile.string == ''
                            ? 'https://www.tenforums.com/attachments/user-accounts-family-safety/322690d1615743307t-user-account-image-log-user.png'
                            : controller.userController.imgProfile.value,
                      ),
                    ),
                    const SizedBox(
                      width: 36,
                    ),
                    Obx(() {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            constraints: const BoxConstraints(maxWidth: 180),
                            child: Text(
                              controller.userController.nameProfile.string == ''
                                  ? ''
                                  : controller.userController.nameProfile.value,
                              style: semiBold.copyWith(
                                  fontSize: 22, color: lighter),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            controller.userController.storeNameProfile.string == ''
                                ? ''
                                : controller.userController.storeNameProfile.value,
                            style:
                                regular.copyWith(fontSize: 16, color: lighter),
                          ),
                        ],
                      );
                    })
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
                style: semiBold.copyWith(
                  fontSize: 18,
                  color: dark,
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller.navigatedToEditProfile();
                },
                child: Text('Edit Profile',
                    style: medium.copyWith(fontSize: 13, color: lightActive)),
              ),
            ]),
            const SizedBox(height: 15),
            Obx(
              () => CustomTextContainer(
                title: 'Nomor Handphone',
                text: controller.userController.phoneProfile.string == ''
                    ? ''
                    : controller.userController.phoneProfile.value,
                style: controller.userController.phoneProfile.string == ''
                    ? regular.copyWith(fontSize: 13, color: lightActive)
                    : regular.copyWith(fontSize: 13, color: darkHover),
              ),
            ),
            Obx(
              () => CustomTextContainer(
                title: 'Email',
                text: controller.userController.emailProfile.string == ''
                    ? ''
                    : controller.userController.emailProfile.value,
                style: controller.userController.emailProfile.string == ''
                    ? regular.copyWith(fontSize: 13, color: lightActive)
                    : regular.copyWith(fontSize: 13, color: darkHover),
              ),
            ),
            Obx(
              () => CustomTextContainer(
                title: 'Alamat',
                text: controller.userController.addressProfile.string == ''
                    ? ''
                    : controller.userController.addressProfile.value,
                style: controller.userController.addressProfile.string == ''
                    ? regular.copyWith(fontSize: 13, color: lightActive)
                    : regular.copyWith(fontSize: 13, color: darkHover),
              ),
            ),
            Spacer(),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: 'Bergabung ',
                      style:
                          regular.copyWith(fontSize: 13, color: lightActive)),
                  TextSpan(
                      text: DateFormat('dd MMMM yyyy')
                          .format(controller.userController.createdAt.value),
                      style: regular.copyWith(fontSize: 13, color: darkHover)),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                GetStorage().erase();
                Get.offAllNamed(Routes.LOGIN);
              },
              child: Text('Keluar',
                  style: medium.copyWith(fontSize: 20, color: error)),
            ),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}
