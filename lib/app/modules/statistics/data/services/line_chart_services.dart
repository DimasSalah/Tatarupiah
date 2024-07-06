import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:tatarupiah/app/data/endpoint.dart';

import '../models/line_chart_model.dart';

class LineChartServices extends GetxService {
  final Dio dio = Dio();
  final token = GetStorage().read('token');
  final logger = Logger();
  final baseUrl = baseurl;
  String monthInitial = DateFormat('MM').format(DateTime.now());
  String yearInitial = DateFormat('yyyy').format(DateTime.now());

  Future<LineChartModel> getLineChart({
    String? month,
    String? years,
  }) async {
    String monthDate = month ?? monthInitial;
    String yearsDate = years ?? yearInitial;

    try {
      final response = await dio.get(
        '$baseUrl/transaction/multiple-chart?bulan=$monthDate&tahun=$yearsDate',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        logger.i(response.data);
        return LineChartModel.fromJson(response.data);
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
