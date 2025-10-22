import 'dart:developer';

import 'package:caffee/Core/error/custom_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireBaseAuthService {
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException(error: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
          error: 'The account already exists for that email.',
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomException(error: 'check connection the intenet');
      } else {
        throw CustomException(error: 'there is problem,try again later');
      }
    } catch (e) {
      throw CustomException(error: e.toString());
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw CustomException(error: 'User Or Password not Correct.');
      } else if (e.code == 'wrong-password') {
        throw CustomException(error: 'User Or Password not Correct.');
      } else if (e.code == 'invalid-credential') {
        throw CustomException(error: 'User Or Password not Correct.');
      } else {
        log(e.toString());
        throw CustomException(
          error: 'this is A problem,please try again later${e.credential}',
        );
      }
    }
  }
}
