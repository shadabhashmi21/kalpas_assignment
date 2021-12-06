/// email : "ajha1058@gmail.com"
/// password : "ajha1054"
/// passwordConf : "ajha1054"

class LoginRegisterResponse {
  LoginRegisterResponse({
    String? status,
    int? statusCode,
    String? passwordConf,
  }) {
    _status = status;
    _statusCode = statusCode;
  }

  LoginRegisterResponse.fromJson(dynamic json) {
    _status = json['status'];
    _statusCode = json['status-code'];
  }

  String? _status;
  int? _statusCode;

  String? get status => _status;
  int? get statusCode => _statusCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['status-code'] = _statusCode;
    return map;
  }
}
