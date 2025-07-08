abstract class BaseResponse {
  final String status;
  final String message;

  BaseResponse({required this.status, required this.message});

  bool get isSuccess => status == "success";
  bool get isError => status == "error";
}

class ApiResponse<T> extends BaseResponse {
  final T? data;

  ApiResponse({required String status, required String message, this.data}) : super(status: status, message: message);

  factory ApiResponse.fromJson(Map<String, dynamic> json, T Function(Map<String, dynamic>)? fromJsonT) {
    return ApiResponse<T>(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      data: json['data'] != null && fromJsonT != null ? fromJsonT(json['data']) : json['data'],
    );
  }

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T)? toJsonT) {
    return {'status': status, 'message': message, 'data': data != null && toJsonT != null ? toJsonT(data!) : data};
  }
}

// Success response factory
class SuccessResponse<T> extends ApiResponse<T> {
  SuccessResponse({required String message, T? data}) : super(status: "success", message: message, data: data);
}

// Error response factory
class ErrorResponse extends ApiResponse<dynamic> {
  ErrorResponse({required String message, dynamic data}) : super(status: "error", message: message, data: data);
}
