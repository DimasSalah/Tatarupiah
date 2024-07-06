import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../style/colors.dart';
import '../../../../../../style/text_style.dart';
import '../../../../../../utils/date_format.dart';
import '../../../controllers/transaction_controller.dart';
import '../amount_input.dart';
import '../payment_dropdown.dart';
import '../save_button.dart';

class ExpenseTabBar extends StatelessWidget {
  const ExpenseTabBar({
    super.key,
    required this.controller,
  });

  final TransactionController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
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
                        statusDate(controller.date.value),
                        style: medium.copyWith(fontSize: 13, color: normal),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                        onTap: () async {
                          final selectdate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2021),
                            lastDate: DateTime(2050),
                            builder: (context, child) {
                              return Theme(
                                  data: ThemeData.dark().copyWith(
                                    colorScheme: ColorScheme.dark(
                                      primary: dark,
                                      onPrimary: white,
                                      surface: white,
                                      onSurface: dark,
                                      onBackground: white,
                                    ),
                                    primaryColor: dark,
                                    textSelectionTheme: TextSelectionThemeData(
                                        cursorColor: error),
                                    buttonTheme: ButtonThemeData(
                                      buttonColor: error,
                                      textTheme: ButtonTextTheme.primary,
                                    ),
                                  ),
                                  child: child!);
                            },
                          );
                          if (selectdate != null) {
                            controller.selectedDate(selectdate);
                          }
                        },
                        child: Icon(
                          Icons.edit,
                          color: lightActive,
                          size: 24,
                        ),
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
                          controller.navigatedToCategory();
                        },
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: light.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: lightActive),
                            ),
                            child: Obx(
                              () => Text(
                                controller.subCategoryName.value.isEmpty
                                    ? 'Pilih Kategori'
                                    : controller.subCategoryName.value,
                                style: regular.copyWith(
                                    fontSize: 13, color: lightActive),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: controller.noteController,
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
              controller: controller.outcomeController,
              label: 'Nominal Pengeluaran',
              color: error,
              onChanged: controller.outcomeAmount,
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PaymentDropdown(
                    selectedPayment: controller.selectedPayment,
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 40,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23),
            child: SaveButton(
              title: 'Simpan Transaksi',
              onTap: () {
                controller.submitTransaction();
              },
            ),
          ),
        )
      ],
    );
  }
}
