import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:tatarupiah/app/modules/home/transaction/views/components/tab_item.dart';

import '../../../../style/colors.dart';
import '../../../../style/text_style.dart';
import '../../../../utils/date_format.dart';
import '../controllers/transaction_controller.dart';
import 'components/amount_input.dart';
import 'components/income_tabbar.dart';
import 'components/payment_dropdown.dart';

class TransactionView extends GetView<TransactionController> {
  const TransactionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            icon: SvgPicture.asset(
              'assets/icons/arrow_left.svg',
              width: 12,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          title: Text(
            'Tambah Transaksi',
            style: semiBold.copyWith(fontSize: 20),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(40),
              ),
              child: Obx(
                () => Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 23, vertical: 10),
                  decoration: BoxDecoration(
                    color: lightHover,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(14),
                    ),
                  ),
                  child: TabBar(
                    labelPadding: const EdgeInsets.symmetric(vertical: 7),
                    unselectedLabelColor: lightActive,
                    labelColor: light,
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerColor: Colors.transparent,
                    indicator: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 4),
                          color: controller.selectedIndex.value == 0
                              ? success.withOpacity(0.5)
                              : error.withOpacity(0.5),
                          blurRadius: 5,
                          spreadRadius: 1,
                        ),
                      ],
                      color:
                          controller.selectedIndex.value == 0 ? success : error,
                      borderRadius: controller.selectedIndex.value == 0
                          ? const BorderRadius.only(
                              topLeft: Radius.circular(14),
                              bottomLeft: Radius.circular(14),
                            )
                          : const BorderRadius.only(
                              topRight: Radius.circular(14),
                              bottomRight: Radius.circular(14),
                            ),
                    ),
                    tabs: [
                      TabItem(
                        title: 'Pemasukan',
                        textStyle: semiBold.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      TabItem(
                        title: 'Pengeluaran',
                        textStyle: semiBold.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ],
                    onTap: (index) {
                      controller.changeTabIndex(index);
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            //First Tab Bar
            IncomeTabBar(controller: controller),
            //Second TabBar
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 23, right: 23, top: 10, bottom: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            statusDate(DateTime.now()),
                            style: medium.copyWith(fontSize: 13, color: normal),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Icon(
                            Icons.edit,
                            color: lightActive,
                            size: 24,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Get.defaultDialog(
                              //   title: 'Pilih Kategori',
                              //   content: Container(
                              //     height: 300,
                              //     width: 300,
                              //     color: Colors.white,
                              //   ),
                              // );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                color: light.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: lightActive),
                              ),
                              child: Text(
                                'Pilihan Kategori',
                                style: regular.copyWith(
                                    fontSize: 13, color: lightActive),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: 'Catatan',
                                hintStyle:
                                    regular.copyWith(fontSize: 13, color: dark),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: lightActive),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: dark),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 8),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                AmountInput(
                  label: 'Nominal Pengeluaran',
                  color: error,
                  onChanged: controller.expenseAmount,
                ),
                const SizedBox(
                  height: 16,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 23),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PaymentDropdown(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
