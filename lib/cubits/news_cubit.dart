import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalpas_assignment/models/news_response.dart';
import 'package:kalpas_assignment/repositories/news_repository.dart';
import 'package:kalpas_assignment/states/data_state.dart';

class NewsCubit extends Cubit<DataState> {
  NewsCubit({required this.repository}) : super(InitialState()) {
    getNews();
  }

  final NewsRepository repository;

  void getNews() async {
    try {
      emit(LoadingState("Getting data from API ..."));
      final news = await repository.getNews();
      if(news.data == null || news.data!.isEmpty) {
        throw Exception("No data found");
      }
      emit(LoadedState<NewsResponse>("success", news));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}
