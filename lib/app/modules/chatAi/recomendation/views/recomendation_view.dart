import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tatarupiah/app/modules/chatAi/recomendation/views/component/container_custom.dart';
import 'package:tatarupiah/app/style/colors.dart';
import 'package:tatarupiah/app/style/gradient.dart';
import 'package:tatarupiah/app/style/text_style.dart';
import '../controllers/recomendation_controller.dart';

class RecomendationView extends GetView<RecomendationController> {
  const RecomendationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/arrow_left.svg',
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'Ai rekomendasi',
          style: semiBold.copyWith(fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(14),
                      topRight: Radius.circular(14),
                      bottomRight: Radius.circular(14),
                    ),
                    color: light,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 15,
                      top: 10,
                      bottom: 10,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Ayo, biarkan aku membantumu mengalokasikan anggaran dengan maksimal! Kamu memiliki dana sebesar Rp 3.000.000',
                          ),
                        ),
                        SvgPicture.asset(
                          'assets/icons/pencil.svg',
                          width: 20,
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                CircleAvatar(
                  backgroundColor: dark,
                  child: Image.asset(
                    'assets/icons/chatbot.png',
                    width: 50,
                    height: 50,
                  ),
                ),
                SizedBox(height: 350),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 23, vertical: 31),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CustomTextContainer(
                              text: 'transaksi',
                            ),
                            SizedBox(width: 8),
                            CustomTextContainer(
                              text: 'gaji karyawan',
                            ),
                          ],
                        ),
                        SvgPicture.asset('assets/icons/more_menu.svg')
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        CustomTextContainer(
                          text: 'transaksi',
                        ),
                        SizedBox(width: 8),
                        CustomTextContainer(
                          text: 'gaji karyawan',
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        CustomTextContainer(
                          text: 'transaksi',
                        ),
                        SizedBox(width: 8),
                        CustomTextContainer(
                          text: 'gaji karyawan',
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: light,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'data',
                              style:
                                  regular.copyWith(fontSize: 16, color: normal),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  gradient: primary,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.arrow_upward_rounded),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                border: Border(top: BorderSide(color: dark)),
              ),
              height: 260,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
