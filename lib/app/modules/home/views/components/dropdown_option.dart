import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tatarupiah/app/style/text_style.dart';

import '../../../../style/colors.dart';

class DropdownOption extends StatelessWidget {
  final String dropdownValue;
  final void Function(String) onItemSelected;
  const DropdownOption({
    super.key,
    required this.dropdownValue,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        iconEnabledColor: light,
        padding: EdgeInsets.fromLTRB(0, 0, 10, 5),
        elevation: 0,
        icon: SvgPicture.asset(
          'assets/icons/arrow_down.svg',
        ),
        iconSize: 31,
        isDense: true,
        // iconSize: 30,
        dropdownColor: darkHover,
        borderRadius: BorderRadius.circular(14),
        focusColor: lightHover,
        style: medium.copyWith(fontSize: 20, color: light),
        onChanged: (newValue) {
          onItemSelected(newValue.toString());
        },
        value: dropdownValue,
        items: [
          "Pemasukan",
          "Pengeluaran",
          "Keuntungan",
        ].map((selectedType) {
          return DropdownMenuItem(
            child: new Text(
              selectedType, style: medium.copyWith(fontSize: 20, color: light)
            ),
            value: selectedType,
          );
        }).toList(),
      ),
    );
  }
}