// To parse this JSON data, do
//
//     final lineChartModel = lineChartModelFromJson(jsonString);

import 'dart:convert';

LineChartModel lineChartModelFromJson(String str) => LineChartModel.fromJson(json.decode(str));

String lineChartModelToJson(LineChartModel data) => json.encode(data.toJson());

class LineChartModel {
    String status;
    String message;
    Data data;

    LineChartModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory LineChartModel.fromJson(Map<String, dynamic> json) => LineChartModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    MultipleChart multipleChart;
    Summary summary;
    List<PerformaPenjualan> performaPenjualan;

    Data({
        required this.multipleChart,
        required this.summary,
        required this.performaPenjualan,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        multipleChart: MultipleChart.fromJson(json["multiple_chart"]),
        summary: Summary.fromJson(json["summary"]),
        performaPenjualan: List<PerformaPenjualan>.from(json["performa_penjualan"].map((x) => PerformaPenjualan.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "multiple_chart": multipleChart.toJson(),
        "summary": summary.toJson(),
        "performa_penjualan": List<dynamic>.from(performaPenjualan.map((x) => x.toJson())),
    };
}

class MultipleChart {
    List<Expense> income;
    List<Expense> expense;
    List<Expense> profit;

    MultipleChart({
        required this.income,
        required this.expense,
        required this.profit,
    });

    factory MultipleChart.fromJson(Map<String, dynamic> json) => MultipleChart(
        income: List<Expense>.from(json["income"].map((x) => Expense.fromJson(x))),
        expense: List<Expense>.from(json["expense"].map((x) => Expense.fromJson(x))),
        profit: List<Expense>.from(json["profit"].map((x) => Expense.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "income": List<dynamic>.from(income.map((x) => x.toJson())),
        "expense": List<dynamic>.from(expense.map((x) => x.toJson())),
        "profit": List<dynamic>.from(profit.map((x) => x.toJson())),
    };
}

class Expense {
    int x;
    int y;

    Expense({
        required this.x,
        required this.y,
    });

    factory Expense.fromJson(Map<String, dynamic> json) => Expense(
        x: json["x"],
        y: json["y"],
    );

    Map<String, dynamic> toJson() => {
        "x": x,
        "y": y,
    };
}

class PerformaPenjualan {
    String category;
    String totalPenjualan;

    PerformaPenjualan({
        required this.category,
        required this.totalPenjualan,
    });

    factory PerformaPenjualan.fromJson(Map<String, dynamic> json) => PerformaPenjualan(
        category: json["category"],
        totalPenjualan: json["total_penjualan"],
    );

    Map<String, dynamic> toJson() => {
        "category": category,
        "total_penjualan": totalPenjualan,
    };
}

class Summary {
    int pemasukan;
    int pengeluaran;
    int keuntungan;

    Summary({
        required this.pemasukan,
        required this.pengeluaran,
        required this.keuntungan,
    });

    factory Summary.fromJson(Map<String, dynamic> json) => Summary(
        pemasukan: json["pemasukan"],
        pengeluaran: json["pengeluaran"],
        keuntungan: json["keuntungan"],
    );

    Map<String, dynamic> toJson() => {
        "pemasukan": pemasukan,
        "pengeluaran": pengeluaran,
        "keuntungan": keuntungan,
    };
}
