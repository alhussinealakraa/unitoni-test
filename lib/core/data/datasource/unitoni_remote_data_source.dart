import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import '../../../app/data/models/base_response_model.dart';
import '../../utilities/constants.dart';
import '../../utilities/dio/token_option.dart';
import '../../utilities/enums.dart';
import '../../utilities/error/error_model.dart';
import '../../utilities/error/failure.dart';

class UnitoniRemoteDataSource {
  UnitoniRemoteDataSource({
    required Dio client,
  })  : _client = client;

  final Dio _client;

  Future<Object?> baseRequest<T>(
      {required METHOD method,
      required String endpoint,
      required T Function(Map<String, dynamic>) mapper,
      dynamic data,
      Map<String, dynamic>? headers,
      String? messageErrorKey = 'msg_something_wrong',
      bool withAuth = true,
      bool isGoogleAPI = false,
      bool isWithoutBaseErrorModel = false,
      Function(ErrorModel?)? onFailure}) async {
    try {
      late Response response;
      final Options options = withAuth
          ? TokenOption.toOptions().copyWith(headers: headers)
          : Options(headers: headers);
      if (headers != null) {
        options.headers = headers;
      }
      print(_client.options.headers);
      switch (method) {
        case METHOD.GET:
          response = await _client.get(endpoint, options: options);
          break;
        case METHOD.POST:
          response = await _client.post(
            endpoint,
            data: data,
            options: options,
          );
          break;
        case METHOD.PUT:
          response = await _client.put(
            endpoint,
            data: data,
            options: options,
          );
          break;
        default:
          throw UnimplementedError('$method not implemented');
      }

      if (isWithoutBaseErrorModel) {
        if ((response.statusCode) != kOkCode) {
          throw ServerFailure(ErrorModel.fromJson(response.data).message);
        }
        if ((response.statusCode) == kOkCode) {
          if (response.data is List) {
            return mapper(response.data);
          }
          if (response.data['status'] == false) {
            throw ServerFailure(response.data["message"]);
          }
          return mapper(response.data);
        }
      } else {
        if ((response.statusCode) != kOkCode) {
          throw ServerFailure(ErrorModel.fromJson(response.data).message);
        }
        if ((response.statusCode) == kOkCode) {
          if (response.data is List) {
            return BaseResponseModel.fromJson(response.data, mapper);
          }
          if (response.data['status'] == false) {
            throw ServerFailure(response.data["message"]);
          }
          return BaseResponseModel.fromJson(response.data, mapper);
        }
      }
      throw ServerFailure(response.data);
    } on DioError catch (e) {
      if (e.error is SocketException) {
        throw const NetworkFailure(
            "There is a network error, please check your internet connection");
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw const NetworkFailure("Your connection time out");
      }
      if (e.type == DioExceptionType.unknown) {
        if (onFailure != null) {
          if (isWithoutBaseErrorModel) {
            onFailure.call(null);
          } else {
            onFailure.call(
                ErrorModel.fromJson(jsonDecode(e.response?.data)["error"]));
          }
        }
        throw ServerFailure(
            ErrorModel.fromJson(jsonDecode(e.response?.data)["error"]).message);
      }
      throw ServerFailure(messageErrorKey!);
    }
  }

  Future<T?> request<T>({
    required METHOD method,
    required String endpoint,
    required T Function(Map<String, dynamic>) mapper,
    bool withoutMapper = false,
    dynamic data,
    Map<String, dynamic>? headers,
    String? messageErrorKey = 'msg_something_wrong',
    bool withAuth = true,
    bool isLogin = false,
    bool isGoogleAPI = false,
  }) =>
      baseRequest(
              method: method,
              endpoint: endpoint,
              mapper: mapper,
              data: data,
              headers: headers,
              isWithoutBaseErrorModel: withoutMapper,
              messageErrorKey: messageErrorKey,
              withAuth: withAuth,
              isGoogleAPI: isGoogleAPI)
          .then((value) {
        if (value != null) {
          if (!withoutMapper) {
            return (value as BaseResponseModel).result;
          } else {
            return value as T;
          }
        }
      });
}
