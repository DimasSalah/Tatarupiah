import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tatarupiah/app/modules/home/history/views/components/transaction_history_widget.dart';
import 'package:tatarupiah/app/style/colors.dart';
import 'package:tatarupiah/app/style/text_style.dart';
import 'package:tatarupiah/app/utils/currency_format.dart';
import '../../data/models/transaction_model.dart';
import '../../views/components/detail_transaction.dart';
import '../controllers/history_controller.dart';
import 'components/date_range_dialog.dart';
import 'components/profit_header.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller;
    return Scaffold(
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
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: IconButton(
                onPressed: () async {
                  controller.resetSelection();
                  Get.dialog(
                    Obx(
                      () => DateRangeDialog(
                        startDate: controller.startDate.value,
                        endDate: controller.endDate.value,
                        onSelectionChanged: controller.onSelectionChanged,
                        onSubmit: () {
                          controller.transactionsList.clear();
                          controller.groupedTransactions.clear();
                          controller.currentPage.value = 1;
                          controller.fetchTransaction(
                            controller.startDate.value.toString(),
                            controller.endDate.value.toString(),
                          );
                          Get.back();
                          print(
                              'range start date: ${controller.startDate.value} range end date: ${controller.endDate.value}');
                          // controller.fetchTransaction();
                        },
                      ),
                    ),
                  );
                },
                icon: SvgPicture.asset(
                  'assets/icons/calendar_dark.svg',
                ),
              ),
            )
          ],
          title: Text(
            'Riwayat Transaksi',
            style: semiBold.copyWith(fontSize: 20),
          ),
        ),
        body: Column(
          children: [
            const Gap(10),
            Obx(
              () => controller.isLoading.value
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return const Skeletonizer(
                          child: TransactionHistoryWidget(
                            icon: 'assets/icons/plus.svg',
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
                      : Expanded(
                          child: GetBuilder<HistoryController>(
                              id: 'history',
                              builder: (controller) {
                                return ListView.builder(
                                  controller: controller.scrollController,
                                  itemCount: controller
                                          .groupedTransactions.keys.length +
                                      (controller.hasMoreData.value &&
                                              controller.isFetchingMore.value
                                          ? 1
                                          : 0),
                                  itemBuilder: (context, index) {
                                    if (index <
                                        controller
                                            .groupedTransactions.keys.length) {
                                      DateTime date = controller
                                          .groupedTransactions.keys
                                          .elementAt(index);
                                      List<TransactionHistory> transactions =
                                          controller.groupedTransactions[date]!;
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ProfitHeader(
                                            countTransaction:
                                                transactions.length.toString(),
                                            profit: currencyFormatWithK(transactions
                                                .fold(
                                                    0,
                                                    (sum, item) =>
                                                        sum +
                                                        item.nominalPenjualan -
                                                        item.nominalPengeluaran)
                                                .toString()),
                                            date: DateFormat('dd MMM yyyy')
                                                .format(
                                                    transactions.first.tanggal),
                                          ),
                                          ...transactions.map((transaction) {
                                            return TransactionHistoryWidget(
                                              icon: transaction.icon,
                                              title: transaction.subKategori,
                                              subtitle: transaction.kategori,
                                              price: transaction.type ==
                                                      'Pemasukan'
                                                  ? transaction.nominalPenjualan
                                                      .toString()
                                                  : transaction
                                                      .nominalPengeluaran
                                                      .toString(),
                                              type: transaction.type,
                                              longPress: () {
                                                Get.dialog(
                                                  Dialog(
                                                    child: DetailTransaction(
                                                        transaction:
                                                            transaction,
                                                        onTap: () {
                                                          controller
                                                              .delTransaction(
                                                                  transaction
                                                                      .id);
                                                          Get.back();
                                                        }),
                                                  ),
                                                );
                                              },
                                            );
                                          }).toList(),
                                        ],
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
                                );
                              }),
                        ),
            ),
          ],
        ));
  }
}
