import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tatarupiah/app/modules/profile/views/componnets/CustomFormTextField.dart';
import 'package:tatarupiah/app/style/colors.dart';
import 'package:tatarupiah/app/style/text_style.dart';
import '../controllers/profile_controller.dart';

class ChangePasswordView extends GetView<ProfileController> {
  const ChangePasswordView({Key? key}) : super(key: key);
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
            'Ubah Password',
            style: semiBold.copyWith(fontSize: 20),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 33),
              Text('Ganti Password', style: semiBold.copyWith(fontSize: 16)),
              const SizedBox(height: 10),
              Obx(
                () => CustomTextFormField(
                  labelText: 'Password Lama',
                  obscureText: controller.obsecureText.value,
                  icon: GestureDetector(
                    onTap: () {
                      controller.obsecureText.value =
                          !controller.obsecureText.value;
                    },
                    child: SizedBox(
                      width: 10,
                      height: 20,
                      child: SvgPicture.asset(
                        controller.obsecureText.value
                            ? 'assets/icons/eye-closed.svg'
                            : 'assets/icons/eye-open.svg',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Obx(
                () => CustomTextFormField(
                  labelText: 'Password Baru',
                  obscureText: controller.obsecureText.value,
                  icon: GestureDetector(
                    onTap: () {
                      controller.obsecureText.value =
                          !controller.obsecureText.value;
                    },
                    child: SizedBox(
                      width: 10,
                      height: 20,
                      child: SvgPicture.asset(
                        controller.obsecureText.value
                            ? 'assets/icons/eye-closed.svg'
                            : 'assets/icons/eye-open.svg',
                      ),
                    ),
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
                      style:
                          regular.copyWith(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
              Gap(20),
            ],
          ),
        ));
  }
}
