part of 'login_cubit.dart';


abstract class LoginState {}

final class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginError extends LoginState {
  final String error;
  LoginError({required this.error});
}
