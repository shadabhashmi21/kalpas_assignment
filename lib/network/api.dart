import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kalpas_assignment/utils/app_utils.dart';
import 'package:kalpas_assignment/utils/log_helper.dart';

import '../config.dart';
import '../custom_exceptions.dart';

class Api {
  static const _apiLogStart = "<<<<<<<   ";
  static const _apiLogEnd = "   >>>>>>>";
  static const _apiLogUrl = "URL -> ";
  static const _apiLogHeaders = "HEADERS -> ";
  static const _apiLogRequest = "REQUEST -> ";
  static const _apiLogResponse = "RESPONSE -> ";

  Future<dynamic> get(String controllerName) async {
    if (!await AppUtils.isInternetConnected()) {
      throw NoInternetException("Internet Error");
    }
    var url = Config.baseUrl + controllerName;
    LogHelper.logDebugging(_apiLogStart + _apiLogUrl + url + _apiLogEnd);
    Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    LogHelper.logDebugging(
        _apiLogStart + _apiLogResponse + response.body + _apiLogEnd);
    return _response(response);
  }

  Future<dynamic> post(String controllerName, dynamic data) async {
    if (!await AppUtils.isInternetConnected()) {
      throw NoInternetException("Internet Error");
    }
    var url = Config.baseUrl + controllerName;
    LogHelper.logDebugging(_apiLogStart + _apiLogUrl + url + _apiLogEnd);
    var uri = Uri.parse(url);
    var headers = {"Content-Type": "application/json"};
    LogHelper.logDebugging(
        _apiLogStart + _apiLogHeaders + headers.toString() + _apiLogEnd);
    var requestBody = json.encode(data);
    LogHelper.logDebugging(
        _apiLogStart + _apiLogRequest + requestBody + _apiLogEnd);
    final response = await http.post(uri, headers: headers, body: requestBody);
    LogHelper.logDebugging(_apiLogStart +
        _apiLogResponse +
        utf8.decode(response.bodyBytes) +
        _apiLogEnd);
    return _response(response);
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var body = utf8.decode(response.bodyBytes);
        Map<String, dynamic> responseJson = json.decode(body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
        throw InternalServerException(response.body.toString());
      default:
        throw FetchDataException(
            'Communication Error : ${response.statusCode}');
    }
  }
}
