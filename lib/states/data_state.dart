import 'package:equatable/equatable.dart';

abstract class DataState extends Equatable {}

class InitialState extends DataState {
  @override
  List<Object> get props => [];
}

class LoadingState extends DataState {
  final String? loadingMessage;

  LoadingState(this.loadingMessage);

  @override
  List<String?> get props => [loadingMessage];
}

class LoadedState<T> extends DataState {
  final String? successMessage;
  final T? data;

  LoadedState(this.successMessage, this.data);

  @override
  List<T?> get props => [data];
}

class ErrorState extends DataState {
  final String? errorMessage;

  ErrorState(this.errorMessage);

  @override
  List<String?> get props => [errorMessage];
}
