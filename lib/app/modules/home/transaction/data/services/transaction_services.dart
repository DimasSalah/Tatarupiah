import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../../../data/endpoint.dart';
import '../models/transaction_request.dart';

class TransactionServices extends GetxController {
  final Dio dio = Dio();
  final token = GetStorage().read('token');
  final logger = Logger();
  final baseUrl = baseurl;

  Future<Response> postTransaction(String date, type, note, int subCategoryId,
      int icomeValue, int expanseValue, String payment) async {
    try {
      final response = await dio.post('$baseUrl/transaction',
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $token',
            },
          ),
          data: {
            'tanggal': date,
            'type': type,
            'catatan': note,
            'sub_kategori_id': subCategoryId,
            'nominal_penjualan': icomeValue,
            'nominal_pengeluaran': expanseValue,
            'pembayaran': payment
          });
      if (response.statusCode == 200) {
        logger.i(response.data);
        return response;
      } else {
        logger.e(response);
        throw Exception('Gagal menambahkan transaksi');
      }
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<Response> postTransactionCashier(TransactionRequest transactionRequest) async {
    try {
      final response = await dio.post(
        '$baseUrl/transaction/kasir',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
        data: transactionRequest.toJson()
      );
      if (response.statusCode == 200) {
        logger.i(response.data);
        return response;
      } else {
        logger.e(response);
        throw Exception('Gagal menambahkan transaksi');
      }
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}
