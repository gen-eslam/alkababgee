import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<UserCredential?> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  static Future<UserCredential?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  static Future<void> signOutWithEmailAndPassword() async {
    return await _auth.signOut();
  }

  static Future<User?> getCurrentUser() async {
    return _auth.currentUser;
  }

  static Future<void> deleteUser() async {
    return await _auth.currentUser!.delete();
  }

  static Future<void> updatePassword({required String password}) async {
    return await _auth.currentUser!.updatePassword(password);
  }

  static Future<void> resetPassword({required String email}) async {
    return await _auth.sendPasswordResetEmail(email: email);
  }

  static Future<bool> isEmailVerified() async {
    return _auth.currentUser!.emailVerified;
  }

  static Future<void> sendEmailVerification() async {
    return await _auth.currentUser!.sendEmailVerification();
  }

  static Future<void> traceUserChanges(
      {required void Function(User?)? onData,
      Function()? onDone,
      Function(Object?)? onError,
      bool? cancelOnError}) async {
    _auth.userChanges().listen(
          onData,
          onDone: onDone,
          onError: onError,
          cancelOnError: cancelOnError,
        );
  }
}

//  Timer.periodic(const Duration(seconds: 3), (timer) {
//           data?.reload();
//           if (data!.emailVerified) {
//             timer.cancel();
//           }
//         });