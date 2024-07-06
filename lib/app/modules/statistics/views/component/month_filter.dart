import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tatarupiah/app/modules/statistics/controllers/statistics_controller.dart';
import 'package:tatarupiah/app/style/colors.dart';
import 'package:tatarupiah/app/style/gradient.dart';

import '../../../../style/text_style.dart';

class MonthFilter extends StatelessWidget {
  const MonthFilter({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<StatisticsController>();
    return Dialog(
      child: Container(
        height: 380,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 23,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    controller.subtractCurrentYear();
                  },
                ),
                Obx(() {
                  return Text(
                    controller.currentYear.toString(),
                    style: semiBold.copyWith(fontSize: 18),
                  );
                }),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    controller.addCurrentYear();
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Flexible(
              flex: 1,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.6,
                ),
                itemCount: controller.months.length,
                itemBuilder: (context, index) {
                  final Map<int, String> month = controller.months[index];
                  final String monthName = month.values.first;
                  return Obx(
                    () => Padding(
                      padding: const EdgeInsets.all(5),
                      child: InkWell(
                        focusColor: lightActive,
                        onTap: () {
                          controller.handleMonthChange(month.keys.first);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            gradient:
                                controller.selectedIndex.value == index + 1
                                    ? primary
                                    : LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [normal, dark]),
                            // color: controller.selectedIndex.value == index + 1
                            //     ? greenAccent
                            //     : lightActive,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(monthName,
                                style:
                                    controller.selectedIndex.value == index + 1
                                        ? semiBold.copyWith(
                                            fontSize: 14,
                                            color: dark,
                                          )
                                        : regular.copyWith(
                                            fontSize: 14,
                                            color: white,
                                          )),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        child: Center(
                          child: Text(
                            'Batal',
                            style: medium.copyWith(
                              fontSize: 13,
                              color: dark,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.submitSelectedMonth();
                    },
                    child: Container(
                      width: 90,
                      decoration: BoxDecoration(
                        color: lightActive,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 11,
                        ),
                        child: Center(
                          child: Text(
                            'Pilih',
                            style: medium.copyWith(
                              fontSize: 13,
                              color: dark,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
