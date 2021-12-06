import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kalpas_assignment/cubits/news_cubit.dart';
import 'package:kalpas_assignment/models/news_response.dart';
import 'package:kalpas_assignment/states/data_state.dart';
import 'package:provider/provider.dart';

import '../app_widgets.dart';

class NewsListPage extends HookWidget {
  const NewsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NewsCubit, DataState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return Loading(loadingMessage: state.loadingMessage);
          } else if (state is ErrorState) {
            return Error(
                error: state.errorMessage ?? "",
                onRetryPressed: () {
                  BlocProvider.of<NewsCubit>(context).getNews();
                });
          } else if (state is LoadedState<NewsResponse>) {
            final newsList = state.data!.data!;
            Provider.of<List<News>>(context).clear();
            Provider.of<List<News>>(context).addAll(newsList);
            return ListView.builder(
                itemCount: newsList.length,
                itemBuilder: (context, index) {
                  var item = newsList[index];
                  return NewsCard(
                      title: item.title,
                      summary: item.summary,
                      published: item.published,
                      isLiked: item.isFavourite,
                      onLiked: (value) => item.isFavourite = value);
                });
          } else {
            return Container();
          }
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
