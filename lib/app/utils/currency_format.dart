
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    final int value = int.parse(newValue.text.replaceAll(',', ''));
    final String newText = NumberFormat.currency(locale: 'id', decimalDigits: 0, symbol: '').format(value);
    
    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

String currencyViewFormatter(String value) {
    if (value.isEmpty) return '0';
    final formatter = NumberFormat.currency(locale: 'id', decimalDigits: 0, symbol: 'Rp');
    final amount = int.parse(value);
    return formatter.format(amount).trim();
  }

String currencyWithoutSymbol(String value) {
    if (value.isEmpty) return '0';
    final formatter = NumberFormat.currency(locale: 'id', decimalDigits: 0, symbol: '');
    final amount = int.parse(value);
    return formatter.format(amount);
  }

String currencyFormatWithK(String value) {
  if (value.isEmpty) return '0';
  final amount = int.parse(value);
  if (amount < 1000) {
    // If less than 1000, return the number as is.
    return '$amount';
  } else if (amount < 1000000) {
    // If 1000 or more but less than 1 million, format with 'k'.
    final formatter = NumberFormat("#,##0.0", "id");
    return "${formatter.format(amount / 1000)}k";
  } else {
    // For 1 million or more, you can extend this to use 'M', 'B', etc.
    final formatter = NumberFormat("#,##0.0", "id");
    return "${formatter.format(amount / 1000000)}M";
  }
}