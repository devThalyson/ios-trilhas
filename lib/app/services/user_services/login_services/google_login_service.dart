import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleLoginService {
  static GoogleSignInAccount? user;

  static Future<OAuthCredential?> login(BuildContext context) async {
    final googleSignIn = GoogleSignIn();

    final googleUser = await googleSignIn.signIn();

    if (googleUser == null) {
      return null;
    }

    user = googleUser;

    final googleAuth = await googleUser.authentication;

    print(googleAuth);

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return credential;
  }
}
