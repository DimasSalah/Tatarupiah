import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:tatarupiah/app/data/endpoint.dart';

import '../models/category_model.dart';

class SubCategoryService extends GetxService {
  final Dio _dio = Dio();
  final token = GetStorage().read('token');
  final logger = Logger();
  final baseUrl = baseurl;

  Future<void> deleteSubCategory(int id) async {
    try {
      final response = await _dio.delete(
        '$baseUrl/sub-kategori/$id',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        logger.i(response.data);
      } else {
        logger.e(response.data);
        throw Exception('Gagal menghapus sub kategori');
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
