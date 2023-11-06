import 'package:equatable/equatable.dart';

class LoginErrorModel extends Equatable {
  final String error;
  final String errorDescription;

  const LoginErrorModel({required this.error, required this.errorDescription});

  factory LoginErrorModel.fromJson(Map<String, dynamic> json) =>
      LoginErrorModel(
          error: json["error"], errorDescription: json["error_description"]);

  @override
  List<Object?> get props => [error, errorDescription];
}

class ErrorModel extends Equatable {
  final String? code;
  final String message;
  final String? details;

  // final Data data;

  const ErrorModel({
    this.code,
    required this.message,
    this.details,
    // required this.data
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
    // data: Data.fromJson(json["data"]),
      code: json["code"],
      details: json["details"],
      message: json["message"]);

  @override
  List<Object?> get props => [
    code, message, details,
    // data
  ];
}

class Data extends Equatable {
  final String additionalPorop1;
  final String additionalPorop2;
  final String additionalPorop3;

  const Data(
      {required this.additionalPorop1,
        required this.additionalPorop2,
        required this.additionalPorop3});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
      additionalPorop1: json["additionalPorop1"],
      additionalPorop2: json["additionalPorop2"],
      additionalPorop3: json["additionalPorop3"]);

  @override
  List<Object?> get props =>
      [additionalPorop1, additionalPorop2, additionalPorop3];
}
