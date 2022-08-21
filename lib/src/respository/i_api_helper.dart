import 'package:bracu_errands/src/model/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class IApiHelper {
  final storage = const FlutterSecureStorage();

  Future<Either<Failure, T>> get<T>({
    required T Function(
      Map<String, dynamic> json,
    )
        fromJson,
    required String endPoint,
    bool withToken = true,
  });

  Future<Either<Failure, T>> post<T>({
    required T Function(
      Map<String, dynamic> json,
    )
        fromJson,
    required Map<String, dynamic> body,
    required String endPoint,
    bool withToken = true,
    bool saveTokens = false,
    bool decode = true,
  });

  Future<Either<Failure, T>> postMultiPart<T>({
    required T Function(
      Map<String, dynamic> json,
    )
        fromJson,
    required Map<String, String> body,
    required String fileName,
    required String path,
    required String endPoint,
  });

  Future<Either<Failure, T>> put<T>({
    required T Function(
      Map<String, dynamic>? json,
    )
        fromJson,
    required Map<String, dynamic> body,
    required String endPoint,
    bool withToken = true,
  });

  Future<Either<Failure, T>> patch<T>({
    required T Function(
      Map<String, dynamic>? json,
    )
        fromJson,
    required Map<String, dynamic> body,
    required String endPoint,
    bool withToken = true,
  });

  Future<Either<Failure, T?>> delete<T>({
    required T Function(
      Map<String, dynamic> json,
    )?
        fromJson,
    Map<String, dynamic>? body,
    required String endPoint,
    bool withToken = true,
  });
}
