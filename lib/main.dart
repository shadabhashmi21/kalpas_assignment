import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalpas_assignment/cubits/login_register_cubit.dart';
import 'package:kalpas_assignment/pages/login_page.dart';
import 'package:kalpas_assignment/repositories/login_register_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<LoginRegisterCubit>(
          create: (context) => LoginRegisterCubit(
                repository: LoginRegisterRepository(),
              ),
          /*child: Provider<List<News>>.value(
              value: const [], child: const DashboardPage())*/
        child: const LoginPage(),
      ),
    );
  }
}
