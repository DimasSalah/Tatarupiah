import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../style/colors.dart';
import '../../../../../style/text_style.dart';
import '../../../../../utils/currency_format.dart';

class AmountInput extends StatelessWidget {
  final String label;
  final Color color;
  final void Function(String) onChanged;
  const AmountInput({
    super.key,
    required this.label,
    required this.color,
    required this.onChanged,
  });

  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 8),
      decoration: BoxDecoration(
        color: light.withOpacity(0.5),
        border: Border(
          top: BorderSide(color: lightHover),
          bottom: BorderSide(color: lightHover),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: regular.copyWith(fontSize: 13),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Rp',
                style:
                    medium.copyWith(fontSize: 25, color: color),
              ),
              const SizedBox(
                  width:
                      5), 
              Expanded(
                child: TextFormField(
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly, CurrencyInputFormatter()],
                  keyboardType: TextInputType.number,
                  onChanged: onChanged,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    fillColor: dark,
                    isDense: true,
                    border: InputBorder.none,
                  ),
                  style:
                      medium.copyWith(fontSize: 25, color: dark),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}