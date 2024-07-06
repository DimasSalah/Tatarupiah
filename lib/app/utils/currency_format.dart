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
    final String newText =
        NumberFormat.currency(locale: 'id', decimalDigits: 0, symbol: '')
            .format(value);

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

String currencyViewFormatter(String value) {
  if (value.isEmpty) return '0';
  final formatter =
      NumberFormat.currency(locale: 'id', decimalDigits: 0, symbol: 'Rp');
  final amount = int.parse(value);
  return formatter.format(amount).trim();
}

String currencyWithoutSymbol(String value) {
  if (value.isEmpty) return '0';
  final formatter =
      NumberFormat.currency(locale: 'id', decimalDigits: 0, symbol: '');
  final amount = int.parse(value);
  return formatter.format(amount);
}

String currencyFormatWithK(String value) {
  if (value.isEmpty) return '0';
  final amount = double.parse(value);
  if (amount < 1000) {
    return amount.toStringAsFixed(0);
  } else if (amount < 1000000) {
    final formatter = NumberFormat("#,##0.0", "id");
    return "${formatter.format(amount / 1000)}rb"; // Menggunakan 'rb' untuk ribu
  } else {
    final formatter = NumberFormat("#,##0.0", "id");
    return "${formatter.format(amount / 1000000)}jt"; // Menggunakan 'jt' untuk juta
  }
}

String currencyFormatWithKDouble(String value) {
  if (value.isEmpty) return '0';
  final amount = double.parse(value);
  if (amount < 1000) {
    return amount.toStringAsFixed(0);
  } else if (amount < 1000000) {
    final formatter = NumberFormat("#,##0.0", "id");
    return "${formatter.format(amount / 1000)}rb"; // Menggunakan 'rb' untuk ribu
  } else {
    final formatter = NumberFormat("#,##0.0", "id");
    return "${formatter.format(amount / 1000000)}jt"; // Menggunakan 'jt' untuk juta
  }
}
