import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:tatarupiah/app/data/endpoint.dart';

import '../models/transaction_model.dart';

class TransactionService extends GetxService {
  final Dio dio = Dio();
  final token = GetStorage().read('token');
  final logger = Logger();
  final baseUrl = baseurl;
  String startDateInitial = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String endDateInitial = DateFormat('yyyy-MM-dd').format(DateTime.now());

  Future<TransactionModel> getTransaction({
    String? startDate,
    String? endDate,
    int page = 1,
  }) async {
    String start = startDate ?? startDateInitial;
    String end = endDate ?? endDateInitial;

    try {
      final response = await dio.get(
        '$baseUrl/transaction?tanggal_mulai=$start&tanggal_selesai=$end&page=$page',
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
