import 'package:flutter/material.dart';
import 'package:tatarupiah/app/style/text_style.dart';

import '../../../../style/colors.dart';

List menuItems = [
  "Pendapatan",
  "Pengeluaran",
  "Keuntungan",
];

class DropdownOption extends StatelessWidget {
  final String label;
  final Function(dynamic) onItemSelected;
  const DropdownOption({super.key,
    required this.label,
    required this.onItemSelected,});

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      width: 200,
      onSelected: onItemSelected,
      textStyle: medium.copyWith(color: dark,fontSize: 20),
      inputDecorationTheme: InputDecorationTheme(
            isDense: true,
            filled: true,
            fillColor: light,
            contentPadding: const EdgeInsets.fromLTRB(
              15,
              0,
              5,
              0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: Colors.transparent,
                width: 0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: Colors.transparent,
                width: 0,
              ),
            ),
          ),
      menuStyle: MenuStyle(
            shadowColor: MaterialStateProperty.all(Colors.transparent),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(10),
                ),
                side: BorderSide(
                  color: lightHover,
                  width: 2,
                ),
              ),
            ),
          ),
      dropdownMenuEntries: [
        for (int i = 0; i < menuItems.length; i++)
          DropdownMenuEntry(
            value: menuItems[i],
            label: menuItems[i],
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
              padding: MaterialStateProperty.all(EdgeInsets.zero),
              textStyle: MaterialStateProperty.all(
                const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 20,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                  
                ),
              ),
            ),
          )
      ],
    );
  }
}
