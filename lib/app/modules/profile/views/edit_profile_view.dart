import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 23),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 60,
                ),
              ),
              const SizedBox(
                height: 38,
              ),
              CustomTextFormField(
                initialValue: controller.name.value,
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
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
                color: lightActive,
                initialValue: controller.phone.string,
                hintText: controller.phone.string == ''
                    ? 'No Handphone'
                    : controller.phone.string,
              ),
              const SizedBox(height: 33),
              Text('Ganti Password', style: semiBold.copyWith(fontSize: 16)),
              const SizedBox(height: 10),
              const CustomTextFormField(
                labelText: 'Password Lama',
              ),
              const SizedBox(height: 10),
              const CustomTextFormField(
                labelText: 'Password Baru',
              ),
              const SizedBox(height: 46),
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
                      style:
                          regular.copyWith(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
