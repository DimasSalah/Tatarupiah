import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:tatarupiah/app/modules/auth/controllers/auth_controller.dart';
import 'package:tatarupiah/app/modules/auth/register/views/components/CustomTextFormField.dart';
import 'package:tatarupiah/app/style/colors.dart';
import 'package:tatarupiah/app/style/text_style.dart';

import '../../../routes/app_pages.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(right: 29, left: 29, top: 36),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ayo Masuk !',
                    style: semiBold.copyWith(fontSize: 30),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    '''Lanjutkan Perjalananmu! Siap untuk Bermain dengan Angka-angka?''',
                    style: regular.copyWith(fontSize: 16, color: lightActive),
                  ),
                  const Gap(28),
                  Center(
                    child: SvgPicture.asset(
                      'assets/icons/login.svg',
                      width: 200,
                      height: 200,
                    ),
                  ),
                  const Gap(46),
                  CustomTextFieldContainer(
                    labelText: 'email',
                    hintText: 'Masukkan Email',
                    onChanged: controller.onEmailChanged,
                    validator: (email) => controller.validateEmail(email),
                  ),
                  const Gap(11),
                  Obx(
                    () => CustomTextFieldContainer(
                      labelText: 'password',
                      hintText: 'Masukkan Password',
                      obscureText: controller.obscureText.value,
                      validator: (pwd) => controller.validatePassword(pwd),
                      icon: GestureDetector(
                        onTap: () {
                          controller.obscureText.value =
                              !controller.obscureText.value;
                        },
                        child: Container(
                          width: 10,
                          height: 20,
                          child: SvgPicture.asset(
                            controller.obscureText.value
                                ? 'assets/icons/eye-closed.svg'
                                : 'assets/icons/eye-open.svg',
                          ),
                        ),
                      ),
                      onChanged: controller.onPasswordChanged,
                    ),
                  ),
                  const SizedBox(height: 11),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      'lupa password ?',
                      style: regular.copyWith(fontSize: 13, color: normal),
                    ),
                  ),
                  const SizedBox(height: 26),
                  ElevatedButton(
                    onPressed: () {
                      controller.login();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: dark, // Background color
                      padding: const EdgeInsets.symmetric(
                          horizontal: 141, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      fixedSize: const Size(double.infinity, 64),
                    ),
                    child: Text(
                      'Masuk',
                      maxLines: 1,
                      style: regular.copyWith(fontSize: 16, color: white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Spacer(),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Get.offNamed(Routes.REGISTER);
                      },
                      child: RichText(
                        text: TextSpan(
                          text: 'Belum punya akun? ',
                          style: regular.copyWith(
                              fontSize: 13, color: lightActive),
                          children: [
                            TextSpan(
                              text: 'ayo daftar',
                              style:
                                  regular.copyWith(fontSize: 13, color: darker),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ));
  }
}
