import 'dart:convert';
import 'dart:developer';

import 'package:bracu_errands/src/model/failure/failure.dart';
import 'package:bracu_errands/src/respository/utils/logger.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:http/http.dart' as http;
import 'package:bracu_errands/src/respository/i_api_helper.dart';

class ApiHelper extends IApiHelper {
  ApiHelper._();
  factory ApiHelper.instance() => _instance;
  final String _baseUrl = FlutterConfig.get('API_URL') as String;

  static final ApiHelper _instance = ApiHelper._();

  Future<Map<String, String>> header({required bool withToken}) async {
    if (withToken) {
      final token = await storage.read(key: 'accessToken');

      return {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
    } else {
      return {
        'Content-Type': 'application/json',
        'Content': 'application/json',
      };
    }
  }

  // Future<Option<Failure>> _refreshToken() async {
  //   log('inside refresh');
  //   final token = await storage.read(key: 'refreshToken');
  //   final _response = await http.post(
  //     Uri.parse('$_baseUrl/auth/refresh-tokens'),
  //     body: {'refreshToken': token},
  //   );
  //   log(_response.statusCode.toString());
  //   if (_response.statusCode == 200) {
  //     final _regResponse = jsonDecode(_response.body) as Map<String, dynamic>;
  //     await storage.write(
  //       key: 'accessToken',
  //       // ignore: avoid_dynamic_calls
  //       value: _regResponse['access']['token'] as String,
  //     );
  //     await storage.write(
  //       key: 'refreshToken',
  //       // ignore: avoid_dynamic_calls
  //       value: _regResponse['refresh']['token'] as String,
  //     );
  //     return none();
  //   } else {
  //     log('session expired');
  //     return some(
  //       const Failure(
  //         errorCode: 999,
  //         message: 'Session expired. Please restart the app',
  //       ),
  //     );
  //   }
  // }

  @override
  Future<Either<Failure, T>> get<T>({
    required T Function(Map<String, dynamic> json) fromJson,
    required String endPoint,
    bool withToken = true,
  }) async {
    final _header = await header(withToken: withToken);

    try {
      final _response = await http.get(
        Uri.parse('$_baseUrl$endPoint'),
        headers: _header,
      );

      //logger.d(_response.body, '$endPoint response body');

      final _regResponse = jsonDecode(_response.body) as Map<String, dynamic>;

      logger.d(_getPrettyJSONString(_regResponse), '$endPoint response body');

      if (_response.statusCode == 200) {
        final _typedResponse = fromJson(_regResponse);
        return right(_typedResponse);
      } else {
        final message = _regResponse['message'] as String;
        logger.e(_response.body);

        return left(Failure(message: message, errorCode: _response.statusCode));
      }
    } catch (e) {
      logger.e(e, 'EndPoint: $endPoint method: GET');
      return left(
        const Failure(message: 'Something went wrong', errorCode: 69),
      );
    }
  }

  @override
  Future<Either<Failure, T>> post<T>({
    required T Function(Map<String, dynamic> json) fromJson,
    Map<String, dynamic>? body,
    required String endPoint,
    bool withToken = true,
    bool saveTokens = false,
    bool decode = true,
  }) async {
    final _header = await header(withToken: withToken);
    logger.d('header: $_header');
    //body.remove('runtimeType');

    try {
      final _response = await http.post(
        Uri.parse('$_baseUrl$endPoint'),
        body: jsonEncode(body),
        headers: _header,
      );

      logger
        ..d('postCall: ${jsonEncode(body)} header: $_header')
        ..d(_response.body, '$endPoint response body');

      if (!decode) return right(<Map<String, dynamic>>{} as T);

      final _regResponse = jsonDecode(_response.body) as Map<String, dynamic>;

      if (_response.statusCode >= 200 && _response.statusCode <= 299) {
        final _typedResponse = fromJson(_regResponse);
        if (saveTokens) {
          await storage.write(
            key: 'userId',
            value:
                // ignore: avoid_dynamic_calls
                _regResponse['user']['id'] as String,
          );
          await storage.write(
            key: 'accessToken',
            // ignore: avoid_dynamic_calls
            value: _regResponse['tokens']['access']['token'] as String,
          );
          await storage.write(
            key: 'refreshToken',
            // ignore: avoid_dynamic_calls
            value: _regResponse['tokens']['refresh']['token'] as String,
          );
        }
        return right(_typedResponse);
      } else {
        logger
          ..d(_response.body, '$endPoint response body')
          ..e(_response.statusCode, '$endPoint response statusCode');

        final message = _regResponse['message'] as String;
        logger.e(_response.body);

        return left(Failure(message: message, errorCode: _response.statusCode));
      }
    } catch (e) {
      logger.e(e, 'EndPoint: $endPoint method: POST');
      return left(
        const Failure(message: 'Something went wrong', errorCode: 69),
      );
    }
  }

  @override
  Future<Either<Failure, T>> postMultiPart<T>({
    required T Function(Map<String, dynamic> json) fromJson,
    String method = 'POST',
    required Map<String, String> body,
    required String fileName,
    required String path,
    required String endPoint,
  }) async {
    final _header = await header(withToken: true);

    _header.addAll({'Content-Type': 'multipart/form-data'});

    final uri = Uri.parse(_baseUrl + endPoint);
    final request = http.MultipartRequest(method, uri);
    if (body.isNotEmpty) {
      body.remove('runtimeType');

      request.fields.addAll(body);
    }
    if (path.isNotEmpty) {
      request.files.add(await http.MultipartFile.fromPath(fileName, path));
    }

    logger
      ..i(request.files.length)
      ..i(request.files.first.toString())
      ..i(request.files.first.field)
      ..i(request.files.first.filename);

    request.headers.addAll(_header);

    try {
      final _response = await request.send();
      final respStr = await _response.stream.bytesToString();

      final responseMap = jsonDecode(respStr) as Map<String, dynamic>;

      if (_response.statusCode >= 200 && _response.statusCode <= 299) {
        final _typedResponse = fromJson(responseMap);
        logger.wtf('Post creation successfull ${_response.statusCode}');

        return right(_typedResponse);
      } else {
        logger
          ..e('postCall: $body')
          ..e('header: $_header')
          ..e(responseMap)
          ..e(_response.statusCode);

        final message = responseMap['message'] as String;

        return left(Failure(message: message, errorCode: _response.statusCode));
      }
    } catch (e) {
      logger.e(e);
      return left(
        const Failure(message: 'Something went wrong', errorCode: 69),
      );
    }
  }

  @override
  Future<Either<Failure, T>> put<T>({
    required T Function(Map<String, dynamic>? json) fromJson,
    required Map<String, dynamic> body,
    required String endPoint,
    bool withToken = true,
  }) async {
    final _header = await header(withToken: withToken);

    try {
      final _response = await http.put(
        Uri.parse('$_baseUrl$endPoint'),
        body: jsonEncode(body),
        headers: _header,
      );

      logger
        ..d('postCall: ${jsonEncode(body)} header: $_header')
        ..d(_response.body, '$endPoint response body');

      final _regResponse = jsonDecode(_response.body) as Map<String, dynamic>;

      if (_response.statusCode == 200) {
        final _typedResponse = fromJson(_regResponse);
        return right(_typedResponse);
      } else {
        logger
          ..e(_response.body, '$endPoint response body')
          ..e(_response.statusCode, '$endPoint response statusCode');

        final message = _regResponse['message'] as String;
        logger.e(_response.body);

        return left(Failure(message: message, errorCode: _response.statusCode));
      }
    } catch (e) {
      logger.e(e, 'EndPoint: $endPoint method: PUT');
      return left(
        const Failure(message: 'Something went wrong', errorCode: 69),
      );
    }
  }

  @override
  Future<Either<Failure, T?>> delete<T>({
    required T Function(Map<String, dynamic> json)? fromJson,
    Map<String, dynamic>? body,
    required String endPoint,
    bool withToken = true,
  }) async {
    final _header = await header(withToken: withToken);
    try {
      final _response = await http.delete(
        Uri.parse('$_baseUrl$endPoint'),
        headers: _header,
        body: body != null ? jsonEncode(body) : null,
      );
      logger
        ..d('postCall: ${jsonEncode(body)} header: $_header')
        ..d(_response.body, '$endPoint response body');

      // logger
      //  .i(_response.request)
      //  .i(_response.body);

      // final _regResponse = jsonDecode(_response.body) as Map<String, dynamic>

      if (_response.statusCode >= 200 && _response.statusCode <= 299) {
        // final _typedResponse = fromJson(_regResponse);
        // return right(_typedResponse);
        return right(null);
      } else {
        logger
          ..e(_response.body, '$endPoint response body')
          ..e(_response.statusCode, '$endPoint response statusCode');

        final _regResponse = jsonDecode(_response.body) as Map<String, dynamic>;

        final message = _regResponse['message'] as String;
        logger.e(_response.body);

        return left(Failure(message: message, errorCode: _response.statusCode));
      }
    } catch (e) {
      logger.e(e, 'EndPoint: $endPoint method: DELETE');
      return left(
        const Failure(message: 'Something went wrong', errorCode: 69),
      );
    }
  }

  @override
  Future<Either<Failure, T>> patch<T>({
    required T Function(Map<String, dynamic>? json) fromJson,
    required Map<String, dynamic> body,
    required String endPoint,
    bool withToken = true,
  }) async {
    final _header = await header(withToken: withToken);

    try {
      final _response = await http.patch(
        Uri.parse('$_baseUrl$endPoint'),
        body: jsonEncode(body),
        headers: _header,
      );

      logger
        ..d('postCall: ${jsonEncode(body)} header: $_header')
        ..d(_response.body, '$endPoint response body');

      final _regResponse = jsonDecode(_response.body) as Map<String, dynamic>;

      if (_response.statusCode == 200) {
        final _typedResponse = fromJson(_regResponse);
        return right(_typedResponse);
      } else {
        logger
          ..e(_response.body, '$endPoint response body')
          ..e(_response.statusCode, '$endPoint response statusCode');

        final message = _regResponse['message'] as String;
        logger.e(_response.body);

        return left(Failure(message: message, errorCode: _response.statusCode));
      }
    } catch (e) {
      logger.e(e, 'EndPoint: $endPoint method: PATCH');
      return left(
        const Failure(message: 'Something went wrong', errorCode: 69),
      );
    }
  }

  String _getPrettyJSONString(dynamic jsonObject) {
    const encoder = JsonEncoder.withIndent('  ');
    return encoder.convert(jsonObject);
  }
}
