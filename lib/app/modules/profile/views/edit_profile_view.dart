import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tatarupiah/app/modules/profile/views/componnets/CustomFormTextField.dart';
import 'package:tatarupiah/app/routes/app_pages.dart';
import 'package:tatarupiah/app/style/colors.dart';
import 'package:tatarupiah/app/style/text_style.dart';
import '../controllers/profile_controller.dart';

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
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      controller.img.string == ''
                          ? 'https://www.tenforums.com/attachments/user-accounts-family-safety/322690d1615743307t-user-account-image-log-user.png'
                          : controller.img.value,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: GestureDetector(
                      onTap: () {
                        Get.bottomSheet(
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: lightActive,
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ListTile(
                                        dense: true,
                                        trailing: Icon(Icons.camera_alt),
                                        title: Text(
                                          'Camera',
                                          style: medium.copyWith(fontSize: 13),
                                        ),
                                        onTap: () {
                                          Get.back();
                                        },
                                      ),
                                      Divider(
                                        color: dark.withOpacity(0.5),
                                      ),
                                      ListTile(
                                        dense: true,
                                        trailing: Icon(Icons.image),
                                        title: Text(
                                          'Gallery',
                                          style: medium.copyWith(fontSize: 13),
                                        ),
                                        onTap: () {
                                          Get.back();
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    controller.updateProfile();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 23),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: dark,
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'batal',
                                        style: regular.copyWith(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    ),
                                  ),
                                ),
                                const Gap(14),
                              ],
                            ),
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
              initialValue: controller.name.value,
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              labelText: 'Nama Toko',
              initialValue: controller.storeName.string,
              hintText: controller.storeName.string == ''
                  ? 'Nama Toko'
                  : controller.storeName.string,
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              initialValue: controller.email.value,
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              labelText: 'No Handphone',
              initialValue: controller.phone.string,
              hintText: controller.phone.string == ''
                  ? 'No Handphone'
                  : controller.phone.string,
            ),
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
            Spacer(),
            GestureDetector(
              onTap: () {
                controller.updateProfile();
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



              // const SizedBox(height: 33),
              // Text('Ganti Password', style: semiBold.copyWith(fontSize: 16)),
              // const SizedBox(height: 10),
              // const CustomTextFormField(
              //   labelText: 'Password Lama',
              // ),
              // const SizedBox(height: 10),
              // const CustomTextFormField(
              //   labelText: 'Password Baru',
              // ),