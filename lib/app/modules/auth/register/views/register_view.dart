import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:tatarupiah/app/modules/auth/register/views/components/CustomTextFormField.dart';
import 'package:tatarupiah/app/style/colors.dart';
import 'package:tatarupiah/app/style/text_style.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
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
                    'Ayo Daftar !',
                    style: semiBold.copyWith(fontSize: 30),
                  ),
                  Text(
                    '''Tingkatkan Keuangan Usahamu dengan Sedikit Sentuhan Kreatifitas!''',
                    style: regular.copyWith(fontSize: 16, color: lightActive),
                  ),
                  SizedBox(height: 27),
                  Center(
                    child: SvgPicture.asset(
                      'assets/icons/register.svg',
                      width: 200,
                      height: 200,
                    ),
                  ),
                  SizedBox(height: 46),
                  CustomTextFieldContainer(
                    labelText: 'nama',
                    hintText: 'Masukkan Nama Lengkap',
                    onChanged: controller.onNameChanged,
                  ),
                  SizedBox(height: 11),
                  CustomTextFieldContainer(
                    labelText: 'email',
                    hintText: 'Masukkan Email',
                    onChanged: controller.onEmailChanged,
                  ),
                  SizedBox(height: 11),
                  CustomTextFieldContainer(
                      labelText: 'password',
                      hintText: 'Masukkan Password',
                      onChanged: controller.onPasswordChanged),
                  SizedBox(height: 11),
                  CustomTextFieldContainer(
                      labelText: 'konfirm password',
                      hintText: 'Masukkan Konfirmasi Password',
                      onChanged: controller.onConfirmPasswordChanged),
                  SizedBox(height: 26),
                  InkWell(
                      onTap: () {
                        controller.register();
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
                                      : Text('Register Gagal'),
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
                            'Daftar',
                            style: regular.copyWith(fontSize: 16, color: white),
                            textAlign: TextAlign.center,
                          ))),
                  SizedBox(height: 16),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        controller.navigationToLogin();
                      },
                      child: RichText(
                        text: TextSpan(
                          text: 'Sudah punya akun? ',
                          style: regular.copyWith(
                              fontSize: 13, color: lightActive),
                          children: [
                            TextSpan(
                              text: 'Masuk',
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
