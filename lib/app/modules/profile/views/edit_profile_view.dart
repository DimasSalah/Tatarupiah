import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: semiBold.copyWith(fontSize: 20, color: darkHover),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23),
          child: Column(
            children: [
              CircleAvatar(
                radius: 60,
              ),
              SizedBox(
                height: 38,
              ),
              CustomTextFormField(
                labelText: 'Nama',
              ),
              SizedBox(height: 10),
              CustomTextFormField(
                labelText: 'Nama Toko',
              ),
              SizedBox(height: 10),
              CustomTextFormField(
                labelText: 'Email',
              ),
              SizedBox(height: 10),
              CustomTextFormField(
                labelText: 'No Telp',
              ),
              SizedBox(height: 10),
              CustomTextFormField(
                labelText: 'Ganti Password',
              ),
              SizedBox(height: 10),
              CustomTextFormField(
                labelText: 'Password Lama',
              ),
              SizedBox(height: 10),
              CustomTextFormField(
                labelText: 'Password Baru',
              ),
              SizedBox(height: 46),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.PROFILE);
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
