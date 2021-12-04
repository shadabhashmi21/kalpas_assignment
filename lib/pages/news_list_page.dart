import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kalpas_assignment/cubits/news_cubit.dart';
import 'package:kalpas_assignment/models/news_response.dart';
import 'package:kalpas_assignment/states/data_state.dart';
import 'package:like_button/like_button.dart';

import '../app_widgets.dart';

class NewsListPage extends HookWidget {
  const NewsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<News> newsList = [];

    return Scaffold(
      body: BlocBuilder<NewsCubit, DataState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Loading();
          } else if (state is ErrorState) {
            return Error(
                error: state.errorMessage ?? "",
                onRetryPressed: () {
                  BlocProvider.of<NewsCubit>(context).getNews();
                });
          } else if (state is LoadedState<NewsResponse>) {
            newsList = state.data!.data!;
            return ListView.builder(
                itemCount: newsList.length,
                itemBuilder: (context, index) {
                  var item = newsList[index];
                  return Card(
                      margin: const EdgeInsets.all(10),
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            LikeButton(
                              size: 50,
                              isLiked: newsList[index].isFavourite,
                              onTap: (value) async =>
                                  newsList[index].isFavourite = !value,
                            ),
                            Flexible(
                                child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(item.title ?? "",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 6),
                                    child: Text(item.summary ?? "",
                                        style: const TextStyle(
                                            color: Colors.black54)),
                                  ),
                                  Text(item.published ?? "",
                                      style: const TextStyle(
                                          color: Colors.black38)),
                                ],
                              ),
                            ))
                          ],
                        ),
                      )
                      /*ListTile(
                    title: Text(item.title!),
                  ),*/
                      );
                });
          } else {
            return Container();
          }
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
