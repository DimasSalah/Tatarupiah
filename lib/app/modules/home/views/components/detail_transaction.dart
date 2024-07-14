import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tatarupiah/app/utils/currency_format.dart';

import '../../../../style/colors.dart';
import '../../../../style/text_style.dart';
import '../../data/models/transaction_model.dart';

class DetailTransaction extends StatelessWidget {
  final Function() onTap;
  const DetailTransaction({
    super.key,
    required this.onTap,
    required this.transaction,
  });

  final TransactionHistory transaction;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 12,
              left: 12,
              right: 12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  transaction.subKategori,
                  style: semiBold.copyWith(fontSize: 20, color: normal),
                ),
                Container(
                  height: 32,
                  width: 32,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: dark,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: SvgPicture.asset(transaction.icon),
                ),
              ],
            ),
          ),
          Divider(
            color: lightActive,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    currencyViewFormatter(
                        '${transaction.nominalPenjualan - transaction.nominalPengeluaran}'),
                    textAlign: TextAlign.center,
                    style: bold.copyWith(
                        fontSize: 24,
                        color: transaction.type == 'Pemasukan'
                            ? greenAccent
                            : error),
                  ),
                ),
                const Gap(3),
                Center(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                    decoration: BoxDecoration(
                      color: light,
                      border: Border.all(color: lightActive, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      DateFormat("HH:mm, dd EEEE, MMM yyyy").format(
                        DateTime.parse(transaction.createdAt)
                            .add(Duration(hours: 7)),
                      ),
                      style: regular.copyWith(fontSize: 11, color: normal),
                    ),
                  ),
                ),
                const Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rincian',
                      style: semiBold.copyWith(
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      'Jumah : ${transaction.qty == 0 ? '1' : transaction.qty}',
                      style: regular.copyWith(fontSize: 13, color: normal),
                    ),
                  ],
                ),
                Divider(
                  color: lightActive,
                  thickness: 1,
                ),
                const Gap(6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Modal/Pengeluaran',
                      style: regular.copyWith(fontSize: 13),
                    ),
                    Text(
                      'Rp${currencyFormatWithKDouble(transaction.nominalPengeluaran.toString())}',
                      style: semiBold.copyWith(fontSize: 13, color: error),
                    )
                  ],
                ),
                const Gap(4),
                transaction.type == 'Pemasukan'
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Penjualan',
                            style: regular.copyWith(fontSize: 13),
                          ),
                          Text(
                            'Rp${currencyFormatWithKDouble(transaction.nominalPenjualan.toString())}',
                            style:
                                semiBold.copyWith(fontSize: 13, color: success),
                          )
                        ],
                      )
                    : const SizedBox.shrink(),
                const Gap(4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Catatan :',
                          style: regular.copyWith(fontSize: 13, color: normal),
                        ),
                        Text(
                          '${transaction.catatan ?? 'kosong'}',
                          style: regular.copyWith(fontSize: 13, color: normal),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: onTap,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: error.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Icon(Icons.delete, color: error),
                      ),
                    )
                  ],
                ),
                const Gap(10),
              ],
            ),
          ),
          Divider(
            color: lightActive,
            thickness: 1,
          ),
          GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              decoration: BoxDecoration(
                color: normal,
                borderRadius: BorderRadius.circular(10),
              ),
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 12, right: 12, left: 12),
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Kembali',
                textAlign: TextAlign.center,
                style: semiBold.copyWith(
                  fontSize: 15,
                  color: white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
