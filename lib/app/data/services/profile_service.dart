import 'dart:io';
import 'package:http_parser/src/media_type.dart';
import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:tatarupiah/app/data/endpoint.dart';
import 'package:tatarupiah/app/data/models/user_model.dart';

class ProfileService extends GetxService {
  final dio = Dio();
  final token = GetStorage().read('token');
  final logger = Logger();
  final baseUrl = baseurl;

  Future<UserModel> getUser() async {
    try {
      final response = await dio.get(
        '$baseUrl/user',
        options: Options(
          contentType: Headers.jsonContentType,
          headers: {
            'Authorization': 'Bearer ${token}',
          },
        ),
      );
      if (response.statusCode == 200) {
        logger.i(response.data);
        return UserModel.fromJson(response.data);
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

  Future<void> postProfile({
    required String name,
    required String email,
    required String storeName,
    required String phone,
    required String address,
  }) async {
    try {
      final response = await dio.post(
        '$baseUrl/user',
        data: {
          '_method': 'PUT',
          'nama': name,
          'email': email,
          'nama_toko': storeName,
          'no_handphone': phone,
          'alamat': address,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        logger.i(response.data);
      } else {
        throw Exception('Failed to update profile');
      }
    } catch (e) {
      if (e is DioException) {
        logger.e(e.response!.data);
      }
      throw Exception(e);
    }
  }

  Future<Response> changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    try {
      final response = await dio.put(
        '$baseUrl/user/password',
        data: {
          'password_lama': oldPassword,
          'password': newPassword,
          'konfirmasi_password': confirmPassword,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        logger.i(response.data);
        return response;
      } else {
        throw Exception('Failed to change password');
      }
    } catch (e) {
      if (e is DioException) {
        logger.e(e.response!.data);
      }
      throw Exception(e);
    }
  }

  Future<void> updateImage({File? image}) async {
    try {
      String fileName = '';
      MediaType? contentType;

      if (image != null) {
        fileName = image.path.split('/').last;
        String fileExtension = fileName.split('.').last.toLowerCase();

        if (fileExtension == 'jpg' || fileExtension == 'jpeg') {
          contentType = MediaType('image', 'jpeg');
        } else if (fileExtension == 'png') {
          contentType = MediaType('image', 'png');
        } else {
          throw Exception('File type not supported');
        }
      }

      final FormData formData = FormData.fromMap({
        'image': image != null
            ? await MultipartFile.fromFile(
                image.path,
                filename: fileName,
                contentType: contentType,
              )
            : null,
      });
      final response = await dio.post(
        '$baseUrl/user/image',
        data: formData,
        options: Options(
          contentType: Headers.multipartFormDataContentType,
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      logger.i(response.data);
    } catch (e) {
      if (e is DioException) {
        logger.e(e.response!.data);
      }
      throw Exception(e);
    }
  }
}
