import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:tatarupiah/app/modules/auth/controllers/auth_controller.dart';
import 'package:tatarupiah/app/modules/auth/register/views/components/CustomTextFormFieldContainer.dart';
import 'package:tatarupiah/app/style/colors.dart';
import 'package:tatarupiah/app/style/text_style.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(right: 29, left: 29, top: 36),
            child: SingleChildScrollView(
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
                  CustomTextFieldContainer(
                    labelText: 'password',
                    hintText: 'Masukkan Password',
                    onChanged: controller.onPasswordChanged,
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
                      print('masuk');
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 141, vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: double.infinity,
                      height: 64,
                      child: Text(
                        'Masuk',
                        style:
                            regular.copyWith(fontSize: 16, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 100),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // controller.navigationToRegister();
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
                ],
              ),
            ),
          ),
        ));
  }
}
