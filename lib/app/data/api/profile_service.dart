import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:tatarupiah/app/data/endpoint.dart';
import 'package:tatarupiah/app/models/user_model.dart';

class ProfileService extends GetxService {
  final dio = Dio();
  final token = GetStorage().read('token');
  final logger = Logger();
  final baseUrl = baseurl;

  Future<UserModel> getUser() async {
    try {
      final response = await dio.get(
        baseUrl + '/user',
        options: Options(
          contentType: Headers.jsonContentType,
          headers: {
            'Authorization': 'Bearer ${token}',
          },
        ),
      );
      if (response.statusCode == 200) {
        logger.i(response.data);
        return UserModel.fromJson(response.data['data']);
      } else {
        throw Exception('Failed to load profile');
      }
    } catch (e) {
      if (e is DioException) {
        logger.e(e.response!.data);
      }
      throw Exception(e);
    }
  }

  // Future<UserModel> updateUserProfile(UserModel user) async {
  //   try {
  //     final response = await dio.put(
  //       baseUrl + '/user',
  //       data: {
  //         'nama': user.nama,
  //         'email': user.email,
  //         'nama_toko': user.namaToko,
  //         'no_handphone': user.noHandphone,
  //         'alamat': user.alamat,
  //       },
  //       options: Options(
  //         headers: {
  //           'Authorization': 'Bearer ${token}',
  //         },
  //       ),
  //     );
  //     if (response.statusCode == 200) {
  //       print(response.data);
  //       return response;
  //     } else {
  //       throw Exception('Failed to update profile');
  //     }
  //   } catch (e) {
  //     print(e);
  //   }

  // }
}
