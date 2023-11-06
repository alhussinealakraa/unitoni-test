class BaseResponseModel<T> {
  final T? result;
  final String? message;
  final bool? status;

  BaseResponseModel({this.result, this.message, this.status});

  factory BaseResponseModel.fromJson(
      Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJson) {
    return BaseResponseModel<T>(
      result: fromJson(json["value"]),
      message: json['message'],
      status: json['status'],
    );
  }
}
