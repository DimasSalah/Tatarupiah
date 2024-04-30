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

  Future<Response?> login(String email, String password) async {
    try {
      final response = await _dio.post(
        '$baseUrl/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        String token = response.data['data']['token'];
        GetStorage().write('token', token);
        Get.offNamed(Routes.HOME);
        logger.i('Berhasil login');
        // GetStorage().erase();
        return response.data;
      } else {
        logger.e(response.data);
        throw Exception('Gagal login');
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<Response?> register(String nama, String email, String password,
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
        print(response.data);
        // Get.offNamed(Routes.AUTH);
        String token = response.data['data']['token'];
        GetStorage().write('token', token);
        Get.offNamed(Routes.HOME);
        logger.i('Berhasil register');
        print(response.data);
        return response.data;
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
