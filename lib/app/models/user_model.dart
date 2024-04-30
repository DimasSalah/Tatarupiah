class UserModel {
  late String nama;
  late String email;
  late String namaToko;
  late String noHandphone;
  late String alamat;

  UserModel({
    required this.nama,
    required this.email,
    required this.namaToko,
    required this.noHandphone,
    required this.alamat,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    email = json['email'];
    namaToko = json['nama_toko'];
    noHandphone = json['no_handphone'];
    alamat = json['alamat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nama'] = nama;
    data['email'] = email;
    data['nama_toko'] = namaToko;
    data['no_handphone'] = noHandphone;
    data['alamat'] = alamat;
    return data;
  }
}
