import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:tatarupiah/app/data/endpoint.dart';
import 'package:tatarupiah/app/routes/app_pages.dart';

class AuthService extends GetxService {
  final Dio _dio = Dio();
  final token = GetStorage().read('token');
  final logger = Logger();
  final baseUrl = baseurl;

  Future login(String email, String password) async {
    print('service');
    try {
      final response = await _dio.post(
        'https://tatarupiah.my.id/api/login',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
        data: {
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = response.data;
        String token = response.data['data']['token'];
        GetStorage().write('token', token);

        logger.i('Berhasil login');
        return responseData;
      } else {
        logger.e(response.data);
        throw Exception('Gagal login');
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future register(String nama, String email, String password,
      String confirmPassword) async {
    try {
      final response = await _dio.post(
        baseUrl + '/register',
        data: {
          'nama': nama,
          'email': email,
          'password': password,
          'konfirmasi_password': confirmPassword,
        },
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );

      if (response.statusCode == 201) {
        Map<String, dynamic> responseData = response.data;
        // Get.offNamed(Routes.AUTH);
        String token = response.data['data']['token'];
        GetStorage().write('token', token);
        logger.i('Berhasil register');
        return responseData;
      } else {
        logger.e(response.data);
        throw Exception('Gagal register');
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
