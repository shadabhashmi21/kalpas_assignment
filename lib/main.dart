import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalpas_assignment/cubits/news_cubit.dart';
import 'package:kalpas_assignment/pages/news_list_page.dart';
import 'package:kalpas_assignment/repositories/news_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<NewsCubit>(
        create: (context) => NewsCubit(
          repository: NewsRepository(),
        ),
        child: const NewsListPage()
      ),
    );
  }
}
