import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:tatarupiah/app/modules/home/views/components/bar%20graph/bar_graph.dart';
import 'package:tatarupiah/app/modules/home/views/components/dropdown_option.dart';
import 'package:tatarupiah/app/style/colors.dart';
import 'package:tatarupiah/app/utils/date_format.dart';
import '../../../style/text_style.dart';
import '../controllers/home_controller.dart';
import 'components/header_bar.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //dropdown

                          SvgPicture.asset(
                            'assets/icons/calendar.svg',
                            height: 34,
                          ),
                        ],
                      ),
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
                Text(
                  "Lihat Semua",
                  style: medium.copyWith(fontSize: 13, color: lightActive),
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
                      style: semiBold.copyWith(fontSize: 25, color: success),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
            child: Container(
              decoration: BoxDecoration(
                color: lightHover,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 8, right: 16, top: 8, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            color: light,
                            borderRadius: BorderRadius.circular(11),
                          ),
                          child: const Icon(
                            Icons.drive_eta_outlined,
                          ),
                        ),
                        const SizedBox(
                          width: 17.5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Pembelian",
                              style:
                                  medium.copyWith(fontSize: 13, color: normal),
                            ),
                            Text(
                              "Pembelian Pulsa",
                              style: regular.copyWith(
                                  fontSize: 13, color: lightActive),
                            )
                          ],
                        )
                      ],
                    ),
                    Text(
                      "Rp 27.000",
                      style: semiBold.copyWith(fontSize: 16, color: success),
                    )
                  ],
                ),
              ),
            ),
          ),
          DropdownOption(
            label: "Pendapatan",
            onItemSelected: (value) {
              print(value);
            },
          )
        ],
      )),
    );
  }
}
