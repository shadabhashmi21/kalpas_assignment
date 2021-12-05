import 'package:equatable/equatable.dart';

abstract class DataState {}

abstract class DataEquitableState extends Equatable implements DataState {}

class InitialState extends DataEquitableState {
  @override
  List<Object> get props => [];
}

class LoadingState extends DataEquitableState {
  final String? loadingMessage;

  LoadingState(this.loadingMessage);

  @override
  List<String?> get props => [loadingMessage];
}

class LoadedState<T> extends DataEquitableState {
  final String? successMessage;
  final T? data;

  LoadedState(this.successMessage, this.data);

  @override
  List<T?> get props => [data];
}

class ErrorState extends DataEquitableState {
  final String? errorMessage;

  ErrorState(this.errorMessage);

  @override
  List<String?> get props => [errorMessage];
}

class ErrorPromptState extends DataState {
  final String? errorMessage;

  ErrorPromptState(this.errorMessage);
}
