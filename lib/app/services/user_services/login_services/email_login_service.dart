import 'package:app_trilhas/shared/utils/api_response.dart';
import 'package:app_trilhas/shared/utils/firebase_references.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class EmailLoginService {
  static Future<ApiResponse> login(
      String email, String password, BuildContext context) async {
    try {
      var auth = Provider.of<FirebaseReferences>(context, listen: false).auth;

      await auth.signInWithEmailAndPassword(email: email, password: password);

      return ApiResponse.ok(true);
    } on FirebaseException catch (e) {
      print(e);
      if (e.toString().contains('The password is invalid') ||
          e.toString().contains(
              'There is no user record corresponding to this identifier')) {
        return ApiResponse.error('E-mail e/ou senha inválidos');
      } else {
        return ApiResponse.error(
            'Verifique sua conexão com a internet ou tente novamente mais tarde');
      }
    }
  }
}
