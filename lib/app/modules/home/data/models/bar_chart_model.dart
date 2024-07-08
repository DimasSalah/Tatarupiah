// To parse this JSON data, do
//
//     final barChartModel = barChartModelFromJson(jsonString);

import 'dart:convert';

BarChartModel barChartModelFromJson(String str) => BarChartModel.fromJson(json.decode(str));

String barChartModelToJson(BarChartModel data) => json.encode(data.toJson());

class BarChartModel {
    String status;
    String message;
    List<BarChartValue> data;

    BarChartModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory BarChartModel.fromJson(Map<String, dynamic> json) => BarChartModel(
        status: json["status"],
        message: json["message"],
        data: List<BarChartValue>.from(json["data"].map((x) => BarChartValue.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class BarChartValue {
    DateTime date;
    int amount;

    BarChartValue({
        required this.date,
        required this.amount,
    });

    factory BarChartValue.fromJson(Map<String, dynamic> json) => BarChartValue(
        date: DateTime.parse(json["date"]),
        amount: json["amount"],
    );

    Map<String, dynamic> toJson() => {
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "amount": amount,
    };
}
