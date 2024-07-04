import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../style/colors.dart';
import '../../../../../style/text_style.dart';
import '../../../transaction/views/components/amount_input.dart';


class ExpanseAddCategoryTab extends StatelessWidget {
  const ExpanseAddCategoryTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 23, right: 23, top: 20, bottom: 16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: light,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: lighter,
                  ),
                ),
                child: SvgPicture.asset(
                  'assets/icons/gallery.svg',
                ),
              ),
              const Gap(8),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Nama Sub Kategori',
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
                      vertical: 20,
                      horizontal: 8,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        AmountInput(
          label: 'Nominal Pengeluaran',
          color: error,
          onChanged: (value) => print(value),
        ),
      ],
    );
  }
}
