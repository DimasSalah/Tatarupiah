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
  double amount = double.tryParse(value) ?? 0;
  bool isNegative = amount < 0;
  amount = amount.abs();

  String formattedValue;
  if (amount >= 1000) {
    formattedValue = '${(amount / 1000).toStringAsFixed(1)}K';
  } else {
    formattedValue = amount.toStringAsFixed(0);
  }

  if (isNegative) {
    formattedValue = '-$formattedValue';
  }

  return formattedValue;
}

String currencyFormatWithKDouble(String value) {
  if (value.isEmpty) return '0';
  final amount = double.parse(value);
  final isNegative = amount < 0; // Cek apakah nilai negatif
  final absAmount = amount.abs(); // Gunakan nilai absolut untuk format
  if (absAmount < 1000) {
    return '${isNegative ? '-' : ''}${absAmount.toStringAsFixed(0)}';
  } else if (absAmount < 1000000) {
    final formatter = NumberFormat("#,##0.0", "id");
    return "${isNegative ? '-' : ''}${formatter.format(absAmount / 1000)}rb"; // Menggunakan 'rb' untuk ribu
  } else {
    final formatter = NumberFormat("#,##0.0", "id");
    return "${isNegative ? '-' : ''}${formatter.format(absAmount / 1000000)}jt"; // Menggunakan 'jt' untuk juta
  }
}
