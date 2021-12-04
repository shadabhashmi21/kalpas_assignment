import 'package:kalpas_assignment/models/news_response.dart';
import 'package:kalpas_assignment/network/api.dart';

import 'base_repository.dart';

class NewsRepository extends BaseRepository {

  static const _statusCode = 'status-code';
  static const _successStatusCode = 200;
  static const _status = 'status';

  final api = Api();

  Future<NewsResponse> getNews() async {
    final apiResponse = await api.get('news');
    handleApiErrors(apiResponse);
    return NewsResponse.fromJson(apiResponse);
  }

  @override
  handleApiErrors(json) {
    if(json[_statusCode] != _successStatusCode) {
      throw Exception(json[_status]);
    }
  }


}
