/// status : "OK"
/// status-code : 200
/// version : "1.0"
/// access : "public"
/// data : [{"id":40812,"title":"Episode 9: Ed Skoudis, President, SANS Technology Institute","summary":"Chances are, you know Ed. Ed Skoudis is founder of the SANS Institute’s Penetration Testing Curriculum and creator of SANS NetWars, CyberCity, and the Holiday Hack Challenge. Learn more about the upcoming SANS Holiday Hack Challenge at https://www.sans.org/mlp/holiday-hack-challenge/. Disclaimer: The views expressed by the hosts and guests are their own and their participation on the podcast does not imply an endorsement of them or any entity they represent.","link":"https://media.first.org/podcasts/FIRST-Impressions-Ed-Skoudis.mp3","published":"Fri, 03 Dec 2021 00:00:00 GMT"}]

class NewsResponse {
  NewsResponse({
      String? status, 
      int? statusCode,
      String? version, 
      String? access, 
      List<News>? data,}){
    _status = status;
    _statusCode = statusCode;
    _version = version;
    _access = access;
    _data = data;
}

  NewsResponse.fromJson(dynamic json) {
    _status = json['status'];
    _statusCode = json['status-code'];
    _version = json['version'];
    _access = json['access'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(News.fromJson(v));
      });
    }
  }
  String? _status;
  int? _statusCode;
  String? _version;
  String? _access;
  List<News>? _data;

  String? get status => _status;
  int? get statusCode => _statusCode;
  String? get version => _version;
  String? get access => _access;
  List<News>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['status-code'] = _statusCode;
    map['version'] = _version;
    map['access'] = _access;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 40812
/// title : "Episode 9: Ed Skoudis, President, SANS Technology Institute"
/// summary : "Chances are, you know Ed. Ed Skoudis is founder of the SANS Institute’s Penetration Testing Curriculum and creator of SANS NetWars, CyberCity, and the Holiday Hack Challenge. Learn more about the upcoming SANS Holiday Hack Challenge at https://www.sans.org/mlp/holiday-hack-challenge/. Disclaimer: The views expressed by the hosts and guests are their own and their participation on the podcast does not imply an endorsement of them or any entity they represent."
/// link : "https://media.first.org/podcasts/FIRST-Impressions-Ed-Skoudis.mp3"
/// published : "Fri, 03 Dec 2021 00:00:00 GMT"

class News {
  News({
      int? id, 
      String? title, 
      String? summary, 
      String? link, 
      String? published}){
    _id = id;
    _title = title;
    _summary = summary;
    _link = link;
    _published = published;
}

  News.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _summary = json['summary'];
    _link = json['link'];
    _published = json['published'];
  }
  int? _id;
  String? _title;
  String? _summary;
  String? _link;
  String? _published;
  bool isFavourite = false;

  int? get id => _id;
  String? get title => _title;
  String? get summary => _summary;
  String? get link => _link;
  String? get published => _published;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['summary'] = _summary;
    map['link'] = _link;
    map['published'] = _published;
    return map;
  }

}