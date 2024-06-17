import 'package:alkababgee/firebase/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forget_password_state.dart';

class ForgetpasswordCubit extends Cubit<ForgetpasswordState> {
  ForgetpasswordCubit() : super(ForgetpasswordInitial());

  static ForgetpasswordCubit get(context) => BlocProvider.of(context);

  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void sendResetLink() async {
    try {
      emit(ForgetpasswordLoading());
      print("email: ${emailController.text}");
      await FirebaseAuthService.resetPassword(email: emailController.text);
      emit(ForgetpasswordSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(ForgetpasswordError('No user found for that email.'));
      } else if (e.code == 'invalid-email') {
        emit(ForgetpasswordError('The email address is badly formatted.'));
      } else {
        emit(ForgetpasswordError(e.toString()));
      }
    } catch (e) {
      emit(ForgetpasswordError(e.toString()));
    }
  }
}
// ! stateless widget >>
// ! stateful widget >> 
