import 'error_model.dart';

class ServerException implements Exception {
  const ServerException(this.errorModel);
  final ErrorModel errorModel;
}

class NetworkException implements Exception {}

class CacheException implements Exception {}
