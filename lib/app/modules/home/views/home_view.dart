import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tatarupiah/app/modules/home/views/components/TransactionCard.dart';

import 'package:tatarupiah/app/modules/home/views/components/bar%20graph/bar_graph.dart';
import 'package:tatarupiah/app/modules/home/views/components/dropdown_option.dart';
import 'package:tatarupiah/app/style/colors.dart';
import 'package:tatarupiah/app/style/gradient.dart';
import 'package:tatarupiah/app/utils/date_format.dart';
import '../../../style/text_style.dart';
import '../controllers/home_controller.dart';
import 'components/header_bar.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const HeaderBar(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(25),
                      height: 150,
                      decoration: BoxDecoration(
                        color: dark,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
<<<<<<< HEAD
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Obx(
                                () => DropdownOption(
                                    dropdownValue:
                                        controller.dropdownValue.string,
                                    onItemSelected: controller.setSelected),
                              ),
                              SvgPicture.asset(
                                'assets/icons/calendar.svg',
                                height: 34,
                              ),
                            ],
=======
                          //dropdown

                          SvgPicture.asset(
                            'assets/icons/calendar.svg',
                            height: 34,
>>>>>>> 3ebdb5be0b235d5fd99ac2fc284d6562b7e8566e
                          ),
                          Text(
                            "Rp 1.000.000",
                            style: bold.copyWith(fontSize: 33, color: white),
                          )
                        ],
                      ),
<<<<<<< HEAD
=======
                      Text(
                        "Rp 1.000.000",
                        style: bold.copyWith(fontSize: 33, color: light),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      top: 5, left: 25, right: 25, bottom: 25),
                  height: 250,
                  decoration: BoxDecoration(
                    color: dark,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
>>>>>>> 3ebdb5be0b235d5fd99ac2fc284d6562b7e8566e
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          top: 5, left: 25, right: 25, bottom: 25),
                      height: 250,
                      decoration: BoxDecoration(
                        color: dark,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        ),
                      ),
                      child: BarGraph(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18, top: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Transaksi",
                      style: semiBold.copyWith(fontSize: 20, color: normal),
                    ),
                    GestureDetector(
                      onTap: controller.navigationToHistory,
                      child: Text(
                        "Lihat Semua",
                        style:
                            medium.copyWith(fontSize: 13, color: lightActive),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 23,
                  right: 18,
                  bottom: 7,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/doubleCoin.svg',
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Rp 27.000",
                          style:
                              semiBold.copyWith(fontSize: 25, color: success),
                        ),
                      ],
                    ),
                    Text(
                      statusDate(
                        DateTime.now(),
                      ),
                      style: medium.copyWith(fontSize: 13, color: normal),
                    )
                  ],
                ),
              ),
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                  child: TransactionsCard()),
            ],
          ),
<<<<<<< HEAD
        ),
      ),
      floatingActionButton: SizedBox(
        height: 74,
        width: 84,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10, right: 20),
          child: FloatingActionButton(
            splashColor: darker,
            backgroundColor: dark,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            elevation: 0,
            onPressed:
                controller.navigationToTransaction,
            child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  gradient: primary,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: SvgPicture.asset(
                  'assets/icons/plus.svg',
                )),
          ),
        ),
      ),
=======
          DropdownOption(
            label: "Pendapatan",
            onItemSelected: (value) {
              print(value);
            },
          )
        ],
      )),
>>>>>>> 3ebdb5be0b235d5fd99ac2fc284d6562b7e8566e
    );
  }
}
