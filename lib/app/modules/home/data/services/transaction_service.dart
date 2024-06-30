import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:tatarupiah/app/data/endpoint.dart';

import '../models/transaction_model.dart';

class TransactionService extends GetxService {
  final Dio dio = Dio();
  final token = GetStorage().read('token');
  final logger = Logger();
  final baseUrl = baseurl;

  Future<TransactionModel> getTransaction(String date, int page) async {
    print('date: $date');
    try {
      final response = await dio.get(
        '$baseUrl/transaction?tanggal_mulai=2024-06-29&tanggal_selesai=2024-06-30&page=$page',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        logger.i(response.data);
        return TransactionModel.fromJson(response.data);
      } else {
        logger.e(response);
        throw Exception('Gagal mengambil data transaksi');
      }
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}
