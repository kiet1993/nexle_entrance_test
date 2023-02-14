import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:entrance_test/commons/exceptions/app_exception.dart';
import 'package:entrance_test/providers/network/api_request_representable.dart';
import 'package:entrance_test/providers/network/model/response/error_model.dart';
import 'package:get/get_connect/connect.dart';

class APIProvider {
  static const requestTimeOut = Duration(seconds: 25);
  final _client = GetConnect(timeout: requestTimeOut);

  static final _singleton = APIProvider();

  static APIProvider get instance => _singleton;

  Future request(APIRequestRepresentable request) async {
    try {
      log("=========Start request: ${request.url}========");
      log("method : ${request.method}");
      log("headers : ${request.headers}");
      log("query :${request.query}");
      _printObject(request.body);
      final response = await _client.request(
        request.url,
        request.method.string,
        headers: request.headers,
        query: request.query,
        body: request.body
      );
      return _returnResponse(response);
    } catch (error) {
      rethrow;
    }
  }

  dynamic _returnResponse(Response<dynamic> response) {
    log("response: ${response.body}");
    log('=========End request: ${response.request?.url.toString()}========');
    switch (response.statusCode) {
      case 200:
      case 204:
        return response.body;
      default:
        final errorModel = ErrorModel.fromJson(response.body["errors"]);
        throw AppException(message: errorModel.error);
    }
  }

  _printObject(Object object) {
    try {
      Map jsonMapped = json.decode(json.encode(object));
      JsonEncoder encoder = const JsonEncoder.withIndent('  '); 
      String prettyPrint = encoder.convert(jsonMapped); 
      log("body: $prettyPrint"); 
    } catch (e) {
      log(e.toString());
    }
  }
}
