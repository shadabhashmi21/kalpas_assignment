/// email : "ajha1058@gmail.com"
/// password : "ajha1054"
/// passwordConf : "ajha1054"

class LoginRegisterRequest {
  LoginRegisterRequest({
      String? email, 
      String? password, 
      String? passwordConf,}){
    _email = email;
    _password = password;
    _passwordConf = passwordConf;
}

  LoginRegisterRequest.fromJson(dynamic json) {
    _email = json['email'];
    _password = json['password'];
    _passwordConf = json['passwordConf'];
  }
  String? _email;
  String? _password;
  String? _passwordConf;

  String? get email => _email;
  String? get password => _password;
  String? get passwordConf => _passwordConf;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['password'] = _password;
    map['passwordConf'] = _passwordConf;
    return map;
  }

}