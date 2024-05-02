// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    String status;
    String message;
    Data data;

    UserModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    int id;
    String nama;
    String namaToko;
    String email;
    String noHandphone;
    String role;
    String alamat;
    String image;
    DateTime createdAt;
    DateTime updatedAt;

    Data({
        required this.id,
        required this.nama,
        required this.namaToko,
        required this.email,
        required this.noHandphone,
        required this.role,
        required this.alamat,
        required this.image,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        nama: json["nama"],
        namaToko: json["nama_toko"],
        email: json["email"],
        noHandphone: json["no_handphone"],
        role: json["role"],
        alamat: json["alamat"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "nama_toko": namaToko,
        "email": email,
        "no_handphone": noHandphone,
        "role": role,
        "alamat": alamat,
        "image": image,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
