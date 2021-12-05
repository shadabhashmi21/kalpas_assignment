import 'dart:convert';

import 'package:kalpas_assignment/models/login_register_request.dart';
import 'package:kalpas_assignment/models/login_register_response.dart';
import 'package:kalpas_assignment/network/api.dart';

import 'base_repository.dart';

class LoginRegisterRepository extends BaseRepository {
  static const _statusCode = 'status-code';
  static const _successStatusCode = 200;
  static const _status = 'status';

  final api = Api();

  Future<LoginRegisterResponse> doLogin(
      LoginRegisterRequest loginRegisterRequest) async {
    ///final apiResponse = await api.post('login', loginRegisterRequest);
    /// mocking success
    final apiResponse = jsonDecode(
        "{\n\"status\": \"login successful\",\n\"status-code\": 200,\n}");
    handleApiErrors(apiResponse);
    return LoginRegisterResponse.fromJson(apiResponse);
  }

  @override
  handleApiErrors(json) {
    if (json[_statusCode] != _successStatusCode) {
      throw Exception(json[_status]);
    }
  }
}
