import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/io_client.dart';

import '../../shared.dart';

extension ResponseUtils on Response {
  bool get isSuccess {
    return statusCode >= 200 && statusCode < 300;
  }

  bool get hasError => !isSuccess;

  dynamic get json => jsonDecode(body);

  Map<String, dynamic>? get jsonMap => json as Map<String, dynamic>?;

  List<dynamic>? get jsonList => json as List<dynamic>?;
}

abstract class ApiClient extends IOClient {
  Future<Response> _interceptResponse(Response response) async {
    log.d('''
    REQUEST: ${response.request!.url}
    METHOD: ${response.request!.method}
    RESPONSE: ${response.body}
    ''');
    return response;
  }

  Map<String, String> get defaultHeaders => <String, String>{};

  @override
  Future<Response> head(
    Uri url, {
    Map<String, String>? headers,
  }) async {
    return _interceptResponse(
      await super.head(url, headers: <String, String>{
        ...defaultHeaders,
        ...?headers,
      }),
    );
  }

  @override
  Future<Response> get(
    Uri url, {
    Map<String, String>? headers,
  }) async {
    return _interceptResponse(
      await super.get(url, headers: <String, String>{
        ...defaultHeaders,
        ...?headers,
      }),
    );
  }

  @override
  Future<Response> post(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    return _interceptResponse(
      await super.post(
        url,
        headers: <String, String>{
          ...defaultHeaders,
          ...?headers,
        },
        body: body,
        encoding: encoding,
      ),
    );
  }

  @override
  Future<Response> put(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    return _interceptResponse(
      await super.put(
        url,
        headers: <String, String>{
          ...defaultHeaders,
          ...?headers,
        },
        body: body,
        encoding: encoding,
      ),
    );
  }

  @override
  Future<Response> patch(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    return _interceptResponse(
      await super.patch(
        url,
        headers: <String, String>{
          ...defaultHeaders,
          ...?headers,
        },
        body: body,
        encoding: encoding,
      ),
    );
  }

  @override
  Future<Response> delete(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    return _interceptResponse(
      await super.delete(
        url,
        headers: <String, String>{
          ...defaultHeaders,
          ...?headers,
        },
        body: body,
        encoding: encoding,
      ),
    );
  }
}
