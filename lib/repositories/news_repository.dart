import 'package:kalpas_assignment/models/news_response.dart';
import 'package:kalpas_assignment/network/api.dart';

class NewsRepository {
  final api = Api();

  Future<NewsResponse> getNews() async {
    final apiResponse = await api.get('news');
    return NewsResponse.fromJson(apiResponse);
  }
}
