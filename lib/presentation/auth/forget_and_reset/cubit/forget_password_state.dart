part of 'forget_password_cubit.dart';

@immutable
sealed class ForgetpasswordState {}

final class ForgetpasswordInitial extends ForgetpasswordState {}

final class ForgetpasswordLoading extends ForgetpasswordState {}

final class ForgetpasswordSuccess extends ForgetpasswordState {}

final class ForgetpasswordError extends ForgetpasswordState {
  final String message;
  ForgetpasswordError(this.message);
}

final class SendEmailVerificationSuccess extends ForgetpasswordState {}

final class SendEmailVerificationError extends ForgetpasswordState {
  final String message;
  SendEmailVerificationError(this.message);
}
