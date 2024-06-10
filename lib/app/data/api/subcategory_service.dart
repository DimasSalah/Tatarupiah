import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:tatarupiah/app/data/endpoint.dart';

import '../../style/colors.dart';

class SubCategoryService extends GetxService {
  final Dio _dio = Dio();
  final token = GetStorage().read('token');
  final logger = Logger();
  final baseUrl = baseurl;

  Future<Response> postSubCategory(
      {
        required int categoryId,
        required String type,
        required String name,
        required String icon,
        required int income,
        required int expanse,
      }) async {
    try {
      final response = await _dio.post(
        '$baseUrl/sub-kategori',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
        data: {
          'kategori_id': categoryId,
          'type': type,
          'nama': name,
          'icon': icon,
          'nominal_penjualan': income,
          'nominal_pengeluaran': expanse
        },
      );
      if (response.statusCode == 200) {
        logger.i(response);
        Get.back();
        return response;
      } else {
        logger.e(response);
        throw Exception('Gagal menambahkan sub kategori');
      }
    } on DioException catch (e) {
      if (e.response != null && e.response!.statusCode == 409) {
        Get.snackbar('Error', 'Sub Category already exists',colorText: error);
      }
      rethrow;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

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
