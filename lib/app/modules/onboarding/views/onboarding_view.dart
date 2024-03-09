import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tatarupiah/app/routes/app_pages.dart';
import 'package:tatarupiah/app/style/colors.dart';
import 'package:tatarupiah/app/style/gradient.dart';
import 'package:tatarupiah/app/style/text_style.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darker,
      appBar: AppBar(
        backgroundColor: light,
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: light,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                ),
                PageView.builder(
                  controller: controller.pageController,
                  itemCount: controller.imagePaths.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: SvgPicture.asset(
                        controller.imagePaths[index],
                        width: 30,
                        height: 30,
                      ),
                    );
                  },
                  onPageChanged: (index) {
                    controller.currentPage.value = index;
                  },
                ),
                Positioned(
                  bottom: 20.0,
                  left: 0,
                  right: 0,
                  child: Align(
                    child: SmoothPageIndicator(
                      controller: controller.pageController,
                      count: controller.imagePaths.length,
                      effect: ExpandingDotsEffect(
                        activeDotColor: darker,
                        dotColor: lightActive,
                        dotHeight: 8,
                        dotWidth: 8,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              color: light,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Kelola Semua Transaksi!',
                    style: semiBold.copyWith(fontSize: 20)),
                const SizedBox(height: 6),
                Text(
                  'Selamat datang di Tatarupiah kendalikan keuangan usahamu dengan lebih rapi. Ayo mulai perjalanan finansial Anda bersama kami!',
                  style: regular.copyWith(
                    fontSize: 13,
                    color: lightActive,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () {
                    controller.navigationToRegister();
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
                    decoration: BoxDecoration(
                      color: darker,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(width: 5),
                        Text(
                          'Mulai Sekarang',
                          style: regular.copyWith(fontSize: 16, color: light),
                        ),
                        Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            gradient: primary,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: SvgPicture.asset(
                            'assets/icons/left_arrow.svg',
                            height: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    text: 'Sudah punya akun? ',
                    style: regular.copyWith(fontSize: 13, color: lightActive),
                    children: [
                      TextSpan(
                        text: 'Masuk',
                        style: regular.copyWith(fontSize: 13, color: darker),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
