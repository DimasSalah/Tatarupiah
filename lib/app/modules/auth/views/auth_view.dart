import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ayo Masuk !',
                  style: semiBold.copyWith(fontSize: 30),
                ),
                SizedBox(height: 7),
                Text(
                  '''Lanjutkan Perjalananmu! Siap untuk Bermain dengan Angka-angka?''',
                  style: regular.copyWith(fontSize: 16, color: lightActive),
                ),
                SizedBox(height: 28),
                Center(
                  child: SvgPicture.asset(
                    'assets/icons/login.svg',
                    width: 200,
                    height: 200,
                  ),
                ),
                SizedBox(height: 46),
                CustomTextFieldContainer(
                  labelText: 'email',
                  hintText: 'Masukkan Email',
                  onChanged: controller.onEmailChanged,
                ),
                SizedBox(height: 11),
                Obx(
                  () => CustomTextFieldContainer(
                    labelText: 'password',
                    hintText: 'Masukkan Password',
                    obscureText: controller.obscureText.value,
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
                SizedBox(height: 11),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'lupa password ?',
                    style: regular.copyWith(fontSize: 13, color: normal),
                  ),
                ),
                SizedBox(height: 26),
                InkWell(
                    onTap: () {
                      controller.login();
                      Get.dialog(
                        Obx(
                          () {
                            return AlertDialog(
                              content: Container(
                                alignment: Alignment.center,
                                height: 100,
                                width: 100,
                                child: controller.isLoading.value
                                    ? CircularProgressIndicator()
                                    : Text('Login Gagal'),
                              ),
                            );
                          },
                        ),
                      );
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 141, vertical: 20),
                        decoration: BoxDecoration(
                          color: dark,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: double.infinity,
                        height: 64,
                        child: Text(
                          'Masuk',
                          style: regular.copyWith(fontSize: 16, color: white),
                          textAlign: TextAlign.center,
                        ))),
                Spacer(),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.REGISTER);
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'Belum punya akun? ',
                        style:
                            regular.copyWith(fontSize: 13, color: lightActive),
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
                SizedBox(height: 20),
              ],
            ),
          ),
        ));
  }
}
