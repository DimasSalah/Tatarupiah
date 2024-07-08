import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:tatarupiah/app/data/endpoint.dart';

import '../models/bar_chart_model.dart';

class BarChartServices extends GetxService {
  final Dio dio = Dio();
  final token = GetStorage().read('token');
  final logger = Logger();
  final baseUrl = baseurl;
  String endDateInitial = DateFormat('yyyy-MM-dd').format(DateTime.now());

  Future<BarChartModel> getBarChart({
    String? endDate,
    String? type,
  }) async {
    String end = endDate ?? endDateInitial;
    String typeTransaction = type ?? 'Pemasukan';

    try {
      final response = await dio.get(
        '$baseUrl/transaction/bar-chart?type=$typeTransaction&date=$end',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        logger.i(response.data);
        return BarChartModel.fromJson(response.data);
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
