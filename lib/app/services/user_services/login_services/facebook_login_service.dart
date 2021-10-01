import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookLoginService {
  static Future<OAuthCredential?> login() async {
    final response = await FacebookAuth.instance.login();

    print(response.message);

    if (response.status == LoginStatus.success) {
      final facebookCredential =
          FacebookAuthProvider.credential(response.accessToken!.token);
      return facebookCredential;
    } else {
      return null;
    }
  }
}
