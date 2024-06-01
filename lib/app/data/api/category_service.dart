import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:tatarupiah/app/data/endpoint.dart';
import 'package:tatarupiah/app/style/colors.dart';

import '../models/category_model.dart';

class CategoryService extends GetxService {
  final Dio _dio = Dio();
  final token = GetStorage().read('token');
  final logger = Logger();
  final baseUrl = baseurl;

  Future<Response> postCategory(String name, type) async {
    try {
      final response = await _dio.post(
        '$baseUrl/kategori',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
        data: {
          'nama': name,
          'type': type,
        },
      );
      if (response.statusCode == 200) {
        logger.i(response);
        return response;
      } else {
        logger.e(response);
        throw Exception('Gagal menambahkan kategori');
      }
    } on DioException catch (e) {
      if (e.response != null && e.response!.statusCode == 409) {
        Get.snackbar('Error', 'Category already exists',colorText: error);
      }
      rethrow;
    } catch (e) {
      print(e);
      logger.e(e);
      rethrow;
    }
  }

  Future<CategoryModel> getCategory() async {
    try {
      final response = await _dio.get(
        '$baseUrl/kategori',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        logger.i(response.data);
        return CategoryModel.fromJson(response.data);
      } else {
        logger.e(response.data);
        throw Exception('Gagal mendapatkan kategori');
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> deleteCategory(int id) async {
    try {
      final response = await _dio.delete(
        '$baseUrl/kategori/$id',
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
        throw Exception('Gagal menghapus kategori');
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
