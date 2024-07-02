import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tatarupiah/app/modules/home/views/components/TransactionCard.dart';
import 'package:tatarupiah/app/modules/home/views/components/bar%20graph/bar_graph.dart';
import 'package:tatarupiah/app/modules/home/views/components/dropdown_option.dart';
import 'package:tatarupiah/app/style/colors.dart';
import 'package:tatarupiah/app/style/gradient.dart';
import 'package:tatarupiah/app/utils/currency_format.dart';
import 'package:tatarupiah/app/utils/date_format.dart';
import '../../../routes/app_pages.dart';
import '../../../style/text_style.dart';
import '../controllers/home_controller.dart';
import 'components/header_bar.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller.scrollController,
        child: SafeArea(
          child: Column(
            children: [
              Obx(() => HeaderBar(
                  avatar: controller.image.string == ''
                      ? Image.network(
                          'https://www.tenforums.com/attachments/user-accounts-family-safety/322690d1615743307t-user-account-image-log-user.png',
                          fit: BoxFit.cover,
                        )
                      : Image.network(
                          controller.image.string,
                          fit: BoxFit.cover,
                        ))),
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
                              Obx(
                                () => DropdownOption(
                                    dropdownValue:
                                        controller.dropdownValue.string,
                                    onItemSelected: controller.setSelected),
                              ),
                              GestureDetector(
                                onTap: () => GetStorage().erase(),
                                child: SvgPicture.asset(
                                  'assets/icons/calendar.svg',
                                  height: 34,
                                ),
                              ),
                            ],
                          ),
                          Obx(() => Text(
                                currencyViewFormatter(
                                    controller.totalAmount.value.toString()),
                                style:
                                    bold.copyWith(fontSize: 33, color: white),
                              )),
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Transaksi",
                      style: semiBold.copyWith(fontSize: 20, color: normal),
                    ),
                    const Gap(10),
                    CircleAvatar(
                      backgroundColor: dark,
                      radius: 15,
                      child: Obx(
                        () => Text(
                          controller.totalTransaction.toString(),
                          style: regular.copyWith(fontSize: 13, color: white),
                        ),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.HISTORY);
                      },
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
                        Obx(
                          () => Text(
                            currencyViewFormatter(
                                controller.totalProfit.value.toString()),
                            style: semiBold.copyWith(
                                fontSize: 25, color: greenAccent),
                          ),
                        )
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
              Obx(
                () => controller.isLoading.value
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return const Skeletonizer(
                            child: TransactionCard(
                              icon: 'assets/icons/add.svg',
                              title: 'Loading Title',
                              subtitle: 'Makanan',
                              price: '10000',
                              type: 'Pemasukan',
                            ),
                          );
                        },
                      )
                    : controller.transactionsList.isEmpty
                        ? const Center(
                            child: Text("Data Kosong"),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.transactionsList.length +
                                (controller.hasMoreData.value &&
                                        controller.isFetchingMore.value
                                    ? 1
                                    : 0), // Tambahkan item untuk indikator jika ada lebih banyak data
                            itemBuilder: (context, index) {
                              if (index < controller.transactionsList.length) {
                                final transaction =
                                    controller.transactionsList[index];
                                return TransactionCard(
                                  icon: transaction.icon,
                                  title: transaction.subKategori,
                                  subtitle: transaction.kategori,
                                  price: transaction.type == 'Pemasukan'
                                      ? transaction.nominalPenjualan.toString()
                                      : transaction.nominalPengeluaran
                                          .toString(),
                                  type: transaction.type,
                                );
                              } else {
                                if (controller.hasMoreData.value &&
                                    controller.isFetchingMore.value) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else {
                                  return Container(); // Return an empty container if no more data
                                }
                              }
                            },
                          ),
              )
            ],
          ),
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
            onPressed: controller.navigationToTransaction,
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
    );
  }
}
