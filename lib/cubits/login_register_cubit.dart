import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalpas_assignment/models/login_register_request.dart';
import 'package:kalpas_assignment/models/login_register_response.dart';
import 'package:kalpas_assignment/repositories/login_register_repository.dart';
import 'package:kalpas_assignment/states/data_state.dart';

class LoginRegisterCubit extends Cubit<DataState> {
  LoginRegisterCubit({required this.repository}) : super(InitialState());

  final LoginRegisterRepository repository;

  void doLogin(LoginRegisterRequest loginRegisterRequest) async {
    try {
      if (loginRegisterRequest.email == null ||
          loginRegisterRequest.email!.isEmpty) {
        emit(ErrorPromptState('Invalid Email'));
        return;
      }
      if (loginRegisterRequest.password == null ||
          loginRegisterRequest.password!.isEmpty) {
        emit(ErrorPromptState('Invalid Password'));
        return;
      }
      emit(LoadingState("Signing in ..."));
      final data = await repository.doLogin(loginRegisterRequest);
      emit(LoadedState<LoginRegisterResponse>("success", data));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}
