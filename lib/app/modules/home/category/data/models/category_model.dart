// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';
import 'dart:ffi';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
    String status;
    String message;
    List<Category> data;

    CategoryModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        status: json["status"],
        message: json["message"],
        data: List<Category>.from(json["data"].map((x) => Category.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Category {
    int id;
    String nama;
    String type;
    String createdAt;
    String updatedAt;
    List<SubCategory> subCategories;

    Category({
        required this.id,
        required this.nama,
        required this.type,
        required this.createdAt,
        required this.updatedAt,
        required this.subCategories,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        nama: json["nama"],
        type: json["type"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        subCategories: List<SubCategory>.from(json["sub_kategoris"].map((x) => SubCategory.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "type": type,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "sub_kategoris": List<dynamic>.from(subCategories.map((x) => x.toJson())),
    };
}

class SubCategory {
    int id;
    String kategoriId;
    String nama;
    String icon;
    String nominalPenjualan;
    String nominalPengeluaran;
    String createdAt;
    String updatedAt;
    int orderCount;
    SubCategory({
        required this.id,
        required this.kategoriId,
        required this.nama,
        required this.icon,
        required this.nominalPenjualan,
      required this.nominalPengeluaran,   
        required this.createdAt,
        required this.updatedAt,
        this.orderCount = 0,  
    });

    factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        id: json["id"],
        kategoriId: json["kategori_id"],
        nama: json["nama"],
        icon: json["icon"],
        nominalPenjualan: json["nominal_penjualan"],
        nominalPengeluaran: json["nominal_pengeluaran"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "kategori_id": kategoriId,
        "nama": nama,
        "icon": icon,
        "nominal_penjualan": nominalPenjualan,
        "nominal_pengeluaran": nominalPengeluaran,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}