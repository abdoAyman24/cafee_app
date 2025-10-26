import 'dart:developer';

import 'package:caffee/Core/error/custom_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireBaseAuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

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

  Future<UserCredential> signInWithGoogle() async {
    // 1️⃣ تسجيل الدخول في حساب Google
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    if (googleUser == null) {
      throw CustomException(error: 'تم إلغاء تسجيل الدخول');
    }

    // 2️⃣ الحصول على التوكين من Google
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // 3️⃣ إنشاء credential لـ Firebase
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // 4️⃣ تسجيل الدخول في Firebase
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

// Future<void> signInWithFacebook() async {
//   try {
//     final LoginResult result = await FacebookAuth.instance.login();
//     if (result.status == LoginStatus.success) {
//       // نجح التسجيل، احصل على accessToken
//       final AccessToken accessToken = result.accessToken!;
//       // ربطه بـ Firebase Auth
//       final OAuthCredential credential = FacebookAuthProvider.credential(accessToken.token);
//       await FirebaseAuth.instance.signInWithCredential(credential);
//     } else {
//       print('Facebook login failed: ${result.message}');
//     }
//   } catch (e) {
//     print('Error: $e');
//   }
// }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();
    

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}
