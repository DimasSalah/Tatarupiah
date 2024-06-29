import 'package:flutter/material.dart';

import '../../../../../style/colors.dart';
import '../../../../../style/text_style.dart';
import '../../controllers/transaction_controller.dart';

class PaymentOption extends StatelessWidget {
  final int selectedIndex;
  final Function(int)? onTap;
  const PaymentOption({
    super.key,
    required this.selectedIndex,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => onTap?.call(0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              color: selectedIndex == 0 ? dark : light,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text('Tunai',
                style: regular.copyWith(
                    fontSize: 16, color: selectedIndex == 0 ? light : dark)),
          ),
        ),
        GestureDetector(
          onTap: () => onTap?.call(1),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              color: selectedIndex == 1 ? dark : light,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text('Debit',
                style: regular.copyWith(
                    fontSize: 16, color: selectedIndex == 1 ? light : dark)),
          ),
        ),
        GestureDetector(
          onTap: () => onTap?.call(2),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              color: selectedIndex == 2 ? dark : light,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text('Qris',
                style: regular.copyWith(
                    fontSize: 16, color: selectedIndex == 2 ? light : dark)),
          ),
        ),
        GestureDetector(
          onTap: () => onTap?.call(3),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              color: selectedIndex == 3 ? dark : light,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text('E Wallet',
                style: regular.copyWith(
                    fontSize: 16, color: selectedIndex == 3 ? light : dark)),
          ),
        ),
      ],
    );
  }
}
