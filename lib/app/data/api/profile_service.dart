import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:tatarupiah/app/data/endpoint.dart';
import 'package:tatarupiah/app/models/user_model.dart';

class ProfileService extends GetxService {
  final Dio _dio = Dio();
  final token = GetStorage().read('token');
  final logger = Logger();
  final baseUrl = baseurl;

  Future<void> updateUserProfile(UserModel user) async {
    try {
      final response = await _dio.put(
        baseUrl + '/user',
        data: {
          'nama': user.nama,
          'email': user.email,
          'nama_toko': user.namaToko,
          'no_handphone': user.noHandphone,
          'alamat': user.alamat,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer ${GetStorage().read('token')}',
          },
        ),
      );

      if (response.statusCode == 200) {
        print(response.data);
      } else {
        throw Exception('Failed to update profile');
      }
    } catch (e) {
      print(e);
    }

    // // Show success message
    // Get.snackbar(
    //   'Success',
    //   'Profile updated successfully',
    //   backgroundColor: Colors.green,
    //   colorText: Colors.white,
    // );
  }
}
