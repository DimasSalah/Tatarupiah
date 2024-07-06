import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../style/colors.dart';
import '../../../../style/text_style.dart';
import '../controllers/transaction_controller.dart';
import 'components/main/expense_tabbar.dart';
import 'components/main/income_tabbar.dart';
import 'components/tab_item.dart';

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
            ExpenseTabBar(controller: controller),
          ],
        ),
      ),
    );
  }
}
