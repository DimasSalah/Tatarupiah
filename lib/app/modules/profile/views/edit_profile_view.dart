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
              Center(
                child: CircleAvatar(
                  radius: 60,
                ),
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
              SizedBox(height: 33),
              Text('Ganti Password', style: semiBold.copyWith(fontSize: 16)),
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
