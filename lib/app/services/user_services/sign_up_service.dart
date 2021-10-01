import 'package:app_trilhas/app/models/user.dart';
import 'package:app_trilhas/shared/constants/constants.dart';
import 'package:app_trilhas/shared/utils/api_response.dart';
import 'package:app_trilhas/shared/utils/firebase_references.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class SignUpService {
  static Future<ApiResponse> signUp(User user, BuildContext context) async {
    try {
      Uri url = Uri.parse(
          'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=${Constants.firebaseApiKey}');

      var body = convert.json.encode(
        {
          "email": user.email,
          "password": user.password,
          "returnSecureToken": true,
        },
      );

      var response = await http.post(
        url,
        body: body,
      );

      Map<String, dynamic> jsonResponse = convert.json.decode(response.body);

      if (response.statusCode == 200) {
        var userId = jsonResponse['localId'];

        user.id = userId;

        var database =
            Provider.of<FirebaseReferences>(context, listen: false).database;

        var auth = Provider.of<FirebaseReferences>(context, listen: false).auth;

        await auth.signInWithEmailAndPassword(
            email: user.email!, password: user.password!);

        await auth.currentUser!.sendEmailVerification();

        await auth.currentUser!.updateDisplayName(user.name);

        await database.child('users').child(userId).set(
              user.toJson(),
            );

        await auth.signOut();

        return ApiResponse.ok(true);
      } else if (response.body.contains('EMAIL_EXISTS')) {
        return ApiResponse.error('O e-mail informado já está cadastrado');
      } else {
        return ApiResponse.error(
            'Verifique sua conexão com a internet ou tente novamente mais tarde');
      }
    } catch (e) {
      print(e);
      return ApiResponse.error(
          'Verifique sua conexão com a internet ou tente novamente mais tarde');
    }
  }
}
