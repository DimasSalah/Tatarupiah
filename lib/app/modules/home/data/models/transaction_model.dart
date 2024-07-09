// To parse this JSON data, do
//
//     final transactionModel = transactionModelFromJson(jsonString);

import 'dart:convert';

TransactionModel transactionModelFromJson(String str) =>
    TransactionModel.fromJson(json.decode(str));

String transactionModelToJson(TransactionModel data) =>
    json.encode(data.toJson());

class TransactionModel {
  String status;
  String message;
  Info data;

  TransactionModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        status: json["status"],
        message: json["message"],
        data: Info.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Info {
  int currentPage;
  List<TransactionHistory> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  List<Link> links;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  Info({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        currentPage: json["current_page"],
        data: List<TransactionHistory>.from(
            json["data"].map((x) => TransactionHistory.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class TransactionHistory {
  int id;
  int subKategoriId;
  String subKategori;
  String kategori;
  String icon;
  DateTime tanggal;
  String type;
  String mode;
  int qty;
  int nominalPenjualan;
  int nominalPengeluaran;
  dynamic catatan;
  String pembayaran;
  String createdAt;
  String updatedAt;

  TransactionHistory({
    required this.id,
    required this.subKategoriId,
    required this.subKategori,
    required this.kategori,
    required this.icon,
    required this.tanggal,
    required this.type,
    required this.mode,
    required this.qty,
    required this.nominalPenjualan,
    required this.nominalPengeluaran,
    required this.catatan,
    required this.pembayaran,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TransactionHistory.fromJson(Map<String, dynamic> json) =>
      TransactionHistory(
        id: json["id"],
        subKategoriId: json["sub_kategori_id"],
        subKategori: json["sub_kategori"],
        kategori: json["kategori"],
        icon: json["icon"],
        tanggal: DateTime.parse(json["tanggal"]),
        type: json["type"],
        mode: json["mode"],
        qty: json["qty"],
        nominalPenjualan: json["nominal_penjualan"],
        nominalPengeluaran: json["nominal_pengeluaran"],
        catatan: json["catatan"],
        pembayaran: json["pembayaran"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sub_kategori_id": subKategoriId,
        "sub_kategori": subKategori,
        "kategori": kategori,
        "icon": icon,
        "tanggal":
            "${tanggal.year.toString().padLeft(4, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')}",
        "type": type,
        "mode": mode,
        "qty": qty,
        "nominal_penjualan": nominalPenjualan,
        "nominal_pengeluaran": nominalPengeluaran,
        "catatan": catatan,
        "pembayaran": pembayaran,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class Link {
  String? url;
  String label;
  bool active;

  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}
