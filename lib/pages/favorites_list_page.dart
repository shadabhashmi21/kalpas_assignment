import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kalpas_assignment/models/news_response.dart';
import 'package:provider/provider.dart';

import '../app_widgets.dart';

class FavoritesListPage extends HookWidget {
  const FavoritesListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsList = Provider.of<List<News>>(context)
        .where((element) => element.isFavourite)
        .toList();
    return Scaffold(
        body: newsList.isEmpty
            ? const Center(
                child: Text('no data found'),
              )
            : ListView.builder(
                itemCount: newsList.length,
                itemBuilder: (context, index) {
                  var item = newsList[index];
                  return NewsCard(
                      title: item.title,
                      summary: item.summary,
                      published: item.published,
                      isLiked: item.isFavourite,
                      onLiked: (value) => item.isFavourite = value);
                }));
  }
}
