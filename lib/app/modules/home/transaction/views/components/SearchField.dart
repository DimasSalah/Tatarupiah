import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../style/colors.dart';
import '../../../../../style/text_style.dart';

class SearchField extends StatelessWidget {
  final Function(String)? onChanged;
  const SearchField({
    super.key,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: SvgPicture.asset(
          'assets/icons/search.svg',
        ),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 52,
        ),
        hintText: 'Cari Produk',
        hintStyle: medium.copyWith(
          fontSize: 13,
          color: lightActive,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: lightActive,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: normal,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 8,
        ),
      ),
    );
  }
}
