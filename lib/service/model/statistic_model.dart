class Coordinate {
  final double x;
  final double y;

  Coordinate({required this.x, required this.y});

  factory Coordinate.fromJson(Map<String, dynamic> json) {
    return Coordinate(
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
    );
  }
}

class ChartData {
  final List<Coordinate> income;
  final List<Coordinate> expense;
  final List<Coordinate> profit;

  ChartData({required this.income, required this.expense, required this.profit});

  factory ChartData.fromJson(Map<String, dynamic> json) {
    return ChartData(
      income: (json['income'] as List)
          .map((data) => Coordinate.fromJson(data))
          .toList(),
      expense: (json['expense'] as List)
          .map((data) => Coordinate.fromJson(data))
          .toList(),
      profit: (json['profit'] as List)
          .map((data) => Coordinate.fromJson(data))
          .toList(),
    );
  }
}

class ApiResponse {
  final String status;
  final String message;
  final ChartData data;

  ApiResponse({required this.status, required this.message, required this.data});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      status: json['status'],
      message: json['message'],
      data: ChartData.fromJson(json['data']),
    );
  }
}
