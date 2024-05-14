import 'dart:io';

import 'package:dio/dio.dart';
import 'package:elia_app/app/app.logger.dart';
import 'package:elia_app/base_repository/result.dart';

typedef EntityMapper<Entity, Model> = Model Function(Entity entity);

abstract class ErrorCode {
  static const error = 'Error';
  static const failed = 'Failed';
  static const message = 'message';
  static const unauthorized = 'unauthorized';
}

abstract class BaseRepository {
  final String endpoint = 'http://localhost:8080';

  final Map<String, String> _headers = {
    HttpHeaders.acceptHeader: 'application/x-www-form-urlencoded',
    HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
  };

  final _logger = getLogger('BaseRepository');

  Dio get dio => Dio()..options.headers = _headers;

  Future<Result<ResponseType>> safeCall<RequestType, ResponseType>(
    Future<RequestType> call, {
    EntityMapper<RequestType, ResponseType>? entityMapper,
  }) async {
    try {
      final response = await call;
      _logger.d('Api success'); // message -> $response");
      return Success(
        (entityMapper != null ? entityMapper(response) : response)
            as ResponseType,
      );
    } on DioException catch (exception) {
      _logger.e(exception);
      switch (exception.type) {
        case DioExceptionType.badCertificate:
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.connectionError:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.cancel:
          _logger.e('Api error message -> ${'Poor Network connection'}');
          return Error('Poor Network connection', null);

        case DioExceptionType.unknown:
          _logger.e('Api error message -> ${'No network connection'}');
          return Error('No network connection', null);

        case DioExceptionType.badResponse:
          return _getError(exception.response!);
      }
    }
  }

  Result<T> _getError<T>(Response response) {
    if (response.data != null && response.data is Map<String, dynamic>) {
      final Map<String, dynamic> data = response.data as Map<String, dynamic>;
      if (data.containsKey(ErrorCode.message)) {
        _logger.e('Api error response -> ${response.data}');
        final errorMessage = data[ErrorCode.message];
        return Error(errorMessage as String, response.statusCode);
      }
    }
    return Error('This is a generic error', response.statusCode);
  }
}
