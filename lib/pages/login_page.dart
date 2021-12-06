import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:kalpas_assignment/cubits/login_register_cubit.dart';
import 'package:kalpas_assignment/cubits/news_cubit.dart';
import 'package:kalpas_assignment/models/login_register_request.dart';
import 'package:kalpas_assignment/models/login_register_response.dart';
import 'package:kalpas_assignment/models/news_response.dart';
import 'package:kalpas_assignment/repositories/news_repository.dart';
import 'package:kalpas_assignment/states/data_state.dart';
import 'package:kalpas_assignment/utils/app_utils.dart';
import 'package:provider/provider.dart';

import '../app_widgets.dart';
import 'dashboard_page.dart';

class LoginPage extends HookWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const socialIconSize = 40.0;

  @override
  Widget build(BuildContext context) {
    final loginRegisterCubit = BlocProvider.of<LoginRegisterCubit>(context);

    final _emailTextController = useState(TextEditingController());
    final _passwordTextController = useState(TextEditingController());
    bool _isDialogVisible = false;


    showProgressDialog(BuildContext context, String text) {
      _isDialogVisible = true;
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return CustomDialog(text: text);
          }).then((value) => _isDialogVisible = false);
    }

    dismissProgressDialog() {
      if(_isDialogVisible) Navigator.pop(context);
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: BlocConsumer<LoginRegisterCubit, DataState>(
          builder: (BuildContext context, state) {
            return Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/coffee.jpg'), fit: BoxFit.cover),
              ),
              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
                  child: Container(
                      decoration:
                          BoxDecoration(color: Colors.white.withOpacity(0.1)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.15,
                                top: MediaQuery.of(context).size.height * 0.15),
                            child: const Text(
                              "Welcome!!",
                              style:
                                  TextStyle(fontSize: 50, color: Colors.white),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(25),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: HexColor("#E6FFFFFF"),
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(50),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Sign In",
                                  style: TextStyle(
                                      color: HexColor('#00194F'), fontSize: 25),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 30),
                                  child: Column(
                                    children: [
                                      TextField(
                                        controller: _emailTextController.value,
                                        style: TextStyle(
                                            color: HexColor('#F0E9DF')),
                                        decoration: InputDecoration(
                                            fillColor: HexColor('#AC9C8C'),
                                            filled: true,
                                            border: const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20))),
                                            labelText: 'Email:',
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.never,
                                            labelStyle: TextStyle(
                                                color: HexColor('#F0E9DF'))),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextField(
                                        controller:
                                            _passwordTextController.value,
                                        style: TextStyle(
                                            color: HexColor('#F0E9DF')),
                                        decoration: InputDecoration(
                                            fillColor: HexColor('#AC9C8C'),
                                            filled: true,
                                            border: const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20))),
                                            labelText: 'Password:',
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.never,
                                            labelStyle: TextStyle(
                                                color: HexColor('#F0E9DF'))),
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(top: 15),
                                          child: GestureDetector(
                                            onTap: () => AppUtils.showToast(
                                                'Feature not implemented'),
                                            child: const Text(
                                              'Forgot Password?',
                                              style: TextStyle(
                                                  decoration:
                                                      TextDecoration.underline,
                                                  color: Colors.blue),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 15),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      loginRegisterCubit.doLogin(
                                          LoginRegisterRequest(
                                              email: _emailTextController
                                                  .value.text,
                                              password: _passwordTextController
                                                  .value.text));
                                    },
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20),
                                      child: Text(
                                        'Sign in',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ),
                                    )),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 20),
                                  child: const Text(
                                      '----------- Or Sign In With -----------'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        child: Image.asset(
                                          'assets/google.png',
                                          width: socialIconSize,
                                          height: socialIconSize,
                                        ),
                                        onTap: () => AppUtils.showToast(
                                            'feature not implemented'),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      GestureDetector(
                                        child: Image.asset(
                                          'assets/facebook.png',
                                          width: socialIconSize,
                                          height: socialIconSize,
                                        ),
                                        onTap: () => AppUtils.showToast(
                                            'feature not implemented'),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 20),
                                  child: Text.rich(
                                    TextSpan(
                                      text: 'Don\'t have an account? ',
                                      // default text style
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: 'Sign up',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.orange),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () => AppUtils.showToast(
                                                  'feature not implemented')),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ))),
            );
          },
          listener: (BuildContext context, state) {
            if (state is LoadingState) {
              showProgressDialog(context, state.loadingMessage!);
            } else if (state is LoadedState<LoginRegisterResponse>) {
              dismissProgressDialog();
              AppUtils.showToast(state.data!.status!);
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return BlocProvider<NewsCubit>(
                    create: (context) => NewsCubit(
                          repository: NewsRepository(),
                        ),
                    child: Provider<List<News>>.value(
                        value: [], child: const DashboardPage()));
              }));
            } else if (state is ErrorState) {
              dismissProgressDialog();
              AppUtils.showToast(state.errorMessage!);
            } else if (state is ErrorPromptState) {
              dismissProgressDialog();
              AppUtils.showToast(state.errorMessage!);
            }
          },
        ),
      ),
    );
  }
}
