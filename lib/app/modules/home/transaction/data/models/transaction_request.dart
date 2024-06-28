import 'dart:convert';

class TransactionRequest {
  final String tanggal;
  final String pembayaran;
  final String catatan;
  final List<TransactionItem> items;

  TransactionRequest({
    required this.tanggal,
    required this.pembayaran,
    required this.catatan,
    required this.items,
  });

  Map<String, dynamic> toJson() {
    return {
      "tanggal": tanggal,
      "pembayaran": pembayaran,
      "catatan": catatan,
      "items": items.map((item) => item.toJson()).toList(),
    };
  }
}

class TransactionItem {
  final int nominalPenjualan;
  final int qty;
  final int subKategoriId;

  TransactionItem({
    required this.nominalPenjualan,
    required this.qty,
    required this.subKategoriId,
  });

  Map<String, dynamic> toJson() {
    return {
      "nominal_penjualan": nominalPenjualan,
      "qty": qty,
      "sub_kategori_id": subKategoriId,
    };
  }
}
