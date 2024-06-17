import 'dart:io';

import 'package:alkababgee/core/constant/keys.dart';
import 'package:alkababgee/core/services/cache_service.dart';
import 'package:alkababgee/firebase/firebase_auth_service.dart';
import 'package:alkababgee/firebase/firebase_firestore_service.dart';
import 'package:alkababgee/firebase/tables_name.dart';
import 'package:alkababgee/model/auth/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  UserModel user = UserModel(
  
  );

  void register() async {
    emit(RegisterLoading());
    try {
      UserCredential? userCredential =
          await FirebaseAuthService.signUpWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      user.uid = userCredential!.user!.uid;
      CacheService.put(
        key: Keys.userId,
        value: userCredential.user!.uid,
      );
      CacheService.put(key: Keys.username, value: nameController.text);
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      print(e.code);

      if (e.code == 'weak-password') {
        emit(
          RegisterError('The password provided is too weak.'),
        );
      } else if (e.code == 'invalid-email') {
        emit(
          RegisterError('The email address is badly formatted.'),
        );
      } else if (e.code == 'email-already-in-use') {
        emit(
          RegisterError(
              'The email address is already in use by another account.'),
        );
      } else {
        emit(
          RegisterError(e.toString()),
        );
      }
    } catch (e) {
      emit(
        RegisterError(
          e.toString(),
        ),
      );
    }
  }

  Future<void> addDataUserToFirebase() async {
    try {
      user.name = nameController.text;
      user.email = emailController.text;
      user.uid = CacheService.getDataString(
        key: Keys.userId,
      );
      await FirebaseFireStoreService.addData(
        tableName: TablesName.users,
        data: user.toJson(),
      );

      emit(AddInfoSuccess());
    } catch (e) {
      emit(AddInfoError(e.toString()));
    }
  }

  // Future<void> uploadImage() async {
  //   try {
  //     emit(UpdateUserModelLoading());
  //     String url = await FirebaseStorageService.uploadImage(
  //       image: image!,
  //     );
  //     user.imageUrl = url;
  //   } catch (e) {
  //     print(e);
  //     emit(RegisterError(e.toString()));
  //   }
  // }

  // File? image;
  // Future<void> pickImage({required ImageSource source}) async {
  //   final pickedFile = await picker.pickImage(source: source);
  //   if (pickedFile != null) {
  //     image = File(pickedFile.path);
  //     emit(PickImageSuccess());
  //   } else {
  //     if (image == null) {
  //       emit(
  //         PickImageError('No image selected'),
  //       );
  //     }
  //   }
  // }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    return super.close();
  }
}
