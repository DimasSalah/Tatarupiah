import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tatarupiah/app/modules/profile/views/componnets/CustomFormTextField.dart';
import 'package:tatarupiah/app/routes/app_pages.dart';
import 'package:tatarupiah/app/style/colors.dart';
import 'package:tatarupiah/app/style/text_style.dart';
import '../controllers/profile_controller.dart';
import 'componnets/change_avatar.dart';

class EditProfileView extends GetView<ProfileController> {
  const EditProfileView({Key? key}) : super(key: key);
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
          'Edit Profil',
          style: semiBold.copyWith(fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 23),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  Obx(
                    () => CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                        controller.userController.imgProfile.string == ''
                            ? 'https://www.tenforums.com/attachments/user-accounts-family-safety/322690d1615743307t-user-account-image-log-user.png'
                            : controller.userController.imgProfile.value,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: GestureDetector(
                      onTap: () {
                        Get.bottomSheet(
                          changeAvatar(
                            gallery: () {
                              controller.pickFile();
                            },
                            camera: () {
                              controller.captureImage();
                            },
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: lightHover,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(Icons.edit, color: dark, size: 20),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 38,
            ),
            CustomTextFormField(
              labelText: 'Nama',
              controller: controller.nameC,
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
                labelText: 'Nama Toko',
                controller: controller.storeNameC,
                hintText: 'Nama Toko'),
            const SizedBox(height: 10),
            CustomTextFormField(
              labelText: 'Email',
              controller: controller.emailC,
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
                labelText: 'No Handphone',
                keyboardType: TextInputType.phone,
                controller: controller.phoneC,
                hintText: 'No Handphone'),
            const SizedBox(height: 10),
            CustomTextFormField(
                labelText: 'Alamat',
                controller: controller.addressC,
                hintText: 'Alamat'),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                Get.toNamed(Routes.CHANGE_PASSWORD);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                decoration: BoxDecoration(
                  color: lightHover,
                  border: Border.all(color: lightActive),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Ganti Password',
                  style: medium.copyWith(fontSize: 14, color: normal),
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () async {
                await controller.updateProfile();
                await controller.userController.fetchProfile();
                Get.back();
              },
              child: Container(
                width: double.infinity,
                height: 64,
                decoration: BoxDecoration(
                  color: dark,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    'Simpan',
                    style: regular.copyWith(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
