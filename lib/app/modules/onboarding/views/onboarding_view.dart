import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tatarupiah/app/style/colors.dart';
import 'package:tatarupiah/app/style/text_style.dart';

class OnboardingView extends GetView {
  OnboardingView({Key? key}) : super(key: key);
  final List<String> imagePaths = [
    'assets/icons/onboarding1.svg',
    'assets/icons/onboarding2.svg',
    'assets/icons/onboarding3.svg',
  ];

  @override
  Widget build(BuildContext context) {
    int currentPage = 0;
    PageController pageController = PageController();

    // Function to change the page
    void nextPage() {
      currentPage = (currentPage + 1) % imagePaths.length;
      pageController.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    }

    // Automatic page change with a timer
    Timer.periodic(Duration(seconds: 3), (timer) {
      nextPage();
    });

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: light,
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                PageView.builder(
                  controller: pageController,
                  itemCount: imagePaths.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: double.infinity,
                      height: 470,
                      decoration: BoxDecoration(
                        color: light,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: SvgPicture.asset(
                          imagePaths[index],
                          width: 30,
                          height: 30,
                        ),
                      ),
                    );
                  },
                  onPageChanged: (index) {
                    currentPage = index;
                  },
                ),
                Positioned(
                  bottom: 20.0,
                  left: 0,
                  right: 0,
                  child: Align(
                    child: SmoothPageIndicator(
                      controller: pageController,
                      count: imagePaths.length,
                      effect: ExpandingDotsEffect(
                        activeDotColor: Colors.black,
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
          SizedBox(
            height: 4,
          ),
          Container(
            width: double.infinity,
            height: 284,
            decoration: BoxDecoration(
              color: light,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 35, left: 69, right: 70),
                  child: Text('Kelola Semua Transaksi!',
                      style: semiBold.copyWith(fontSize: 20)),
                ),
                SizedBox(height: 6),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 44),
                  child: Text(
                    'Selamat datang di Tatarupiah kendalikan keuangan usahamu dengan lebih rapi. Ayo mulai perjalanan finansial Anda bersama kami!',
                    style: regular.copyWith(
                      fontSize: 13,
                      color: lightActive,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 33, right: 45),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      minimumSize: MaterialStateProperty.all(
                        Size(
                          double.infinity,
                          64,
                        ),
                      ), // Ganti ukuran sesuai kebutuhan
                    ),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(left: 70),
                      child: Row(
                        children: [
                          Text(
                            'Mulai Sekarang',
                            textAlign: TextAlign.center,
                            style: regular.copyWith(
                                fontSize: 16, color: Colors.white),
                          ),
                          SizedBox(
                            width: 44,
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: yellowAccent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.arrow_forward_outlined,
                              color: darker,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 93, right: 93),
                  child: RichText(
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
