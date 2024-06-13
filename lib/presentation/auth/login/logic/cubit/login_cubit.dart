import 'package:alkababgee/core/constant/keys.dart';
import 'package:alkababgee/core/services/cache_service.dart';
import 'package:alkababgee/firebase/firebase_auth_service.dart';
import 'package:alkababgee/firebase/firebase_firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void login() async {
    emit(LoginLoading());
    try {
      UserCredential? user =
          await FirebaseAuthService.signInWithEmailAndPassword(
        email: emailController.text.toString(),
        password: passwordController.text.toString(),
      );
      print(user!.user!.uid);
      await CacheService.put(
        key: Keys.userId,
        value: user.user!.uid,
      );

      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'user-not-found') {
        emit(
          LoginError(error: 'No user found for that email.'),
        );
      } else if (e.code == 'wrong-password') {
        emit(
          LoginError(error: 'Wrong password provided for that user.'),
        );
      } else if (e.code == 'invalid-email') {
        emit(
          LoginError(error: 'The email address is badly formatted.'),
        );
      } else {
        emit(
          LoginError(error: e.toString()),
        );
      }
    } catch (e) {
      emit(
        LoginError(
          error: e.toString(),
        ),
      );
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
