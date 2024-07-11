import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

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
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: controller.formKey,
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
                    const Gap(27),
                    Center(
                      child: SvgPicture.asset(
                        'assets/icons/register.svg',
                        width: 200,
                        height: 200,
                      ),
                    ),
                    const Gap(46),
                    CustomTextFieldContainer(
                      labelText: 'nama',
                      hintText: 'Masukkan Nama Lengkap',
                      onChanged: controller.onNameChanged,
                    ),
                    const Gap(11),
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
                        onChanged: controller.onPasswordChanged,
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
                      ),
                    ),
                    const Gap(11),
                    Obx(() => CustomTextFieldContainer(
                          labelText: 'konfirm password',
                          hintText: 'Masukkan Konfirmasi Password',
                          onChanged: controller.onConfirmPasswordChanged,
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
                        )),
                    const Gap(26),
                    ElevatedButton(
                      onPressed: () {
                        controller.register();
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
                        'Daftar',
                        maxLines: 1,
                        style: regular.copyWith(fontSize: 16, color: white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 16),
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
                                style: regular.copyWith(
                                    fontSize: 13, color: darker),
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
          ),
        ));
  }
}
