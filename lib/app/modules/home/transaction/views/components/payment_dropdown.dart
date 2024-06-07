import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../style/colors.dart';
import '../../../../../style/text_style.dart';

List paymentItems = [
  "Tunai",
  "Debit",
  "Qris",
  "E-Wallet",
];

class PaymentDropdown extends StatelessWidget {
  const PaymentDropdown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      width: 160,
        hintText: 'Pembayaran',
        trailingIcon: SvgPicture.asset(
              'assets/icons/arrow_down_dark.svg',
            ),
        selectedTrailingIcon: SvgPicture.asset(
              'assets/icons/arrow_up_dark.svg',
            ),
        textStyle: regular.copyWith(fontSize: 13, color: dark),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: light,
          hintStyle: regular.copyWith(fontSize: 13, color: dark),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: lightActive),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: lightActive),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 13),
        ),
        menuStyle: MenuStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              side: BorderSide(
                color: lightActive,
                width: 1,
              ),
            ),
          ),
        ),
        dropdownMenuEntries: [
          for (int index = 0; index < paymentItems.length; index++)
            DropdownMenuEntry(
              style: ButtonStyle(
                textStyle: MaterialStatePropertyAll(
                  regular.copyWith(fontSize: 13, color: dark),
                ),
                backgroundColor: MaterialStatePropertyAll(light),
              ),
              value: paymentItems[index],
              label: paymentItems[index],
            )
        ]);
  }
}
