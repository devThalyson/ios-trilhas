import 'package:app_trilhas/app/services/user_services/login_services/apple_login_service.dart';
import 'package:app_trilhas/app/services/user_services/login_services/email_login_service.dart';
import 'package:app_trilhas/app/services/user_services/login_services/facebook_login_service.dart';
import 'package:app_trilhas/app/services/user_services/login_services/google_login_service.dart';
import 'package:app_trilhas/shared/utils/api_response.dart';
import 'package:app_trilhas/shared/utils/firebase_references.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  // Observables

  @observable
  TextEditingController emailTextForm = TextEditingController();

  @observable
  TextEditingController passwordTextForm = TextEditingController();

  @observable
  bool? loginFormIsValid;

  @observable
  bool loginProgress = false;

  @observable
  String emailValidateMensage = '';

  @observable
  String passwordValidateMensage = '';

  @observable
  String loginMensage = '';

  // Actions

  @action
  checkIfLoginFormIsValid() {
    emailFormValidate();
    passwordFormValidate();

    if (emailValidateMensage.isEmpty && passwordValidateMensage.isEmpty) {
      loginFormIsValid = true;
    } else {
      loginFormIsValid = false;
    }
  }

  @action
  clearFields() {
    emailTextForm.text = '';
    passwordTextForm.text = '';
  }

  @action
  Future<dynamic> emailLogin(BuildContext context) async {
    checkIfLoginFormIsValid();

    if (loginFormIsValid!) {
      loginProgress = true;
      ApiResponse response = await EmailLoginService.login(
          emailTextForm.text, passwordTextForm.text, context);
      loginProgress = false;

      if (response.ok!) {
        clearFields();
        loginMensage = '';
        return true;
      } else {
        loginMensage = response.msg!;
        clearFields();
        return false;
      }
    }
  }

  @action
  Future<dynamic> facebookLogin(BuildContext context) async {
    var response = await FacebookLoginService.login();

    if (response != null) {
      try {
        var loginResponse =
            await Provider.of<FirebaseReferences>(context, listen: false)
                .auth
                .signInWithCredential(response);

        var database =
            Provider.of<FirebaseReferences>(context, listen: false).database;

        var firebaseUser =
            await database.child('users').child(loginResponse.user!.uid).once();

        if (firebaseUser.value == null) {
          await database.child('users').child(loginResponse.user!.uid).set(
            {
              "name": loginResponse.user!.displayName,
              "email": loginResponse.user!.email,
              "auth_method": 'Facebook',
            },
          );
        }

        return true;
      } on FirebaseAuthException catch (e) {
        print(e);
        if (e.toString().contains(
            'An account already exists with the same email address but different sign-in credentials')) {
          loginMensage =
              'Suas credenciais do Facebook já estão associadas a outra conta cadastrada no aplicativo';
          return false;
        }

        loginMensage =
            'Verifique sua conexão a internet ou tente novamente mais tarde';
        return false;
      }
    } else {
      return;
    }
  }

  @action
  Future<dynamic> googleLogin(BuildContext context) async {
    var credential = await GoogleLoginService.login(context);

    print(credential);

    if (credential == null) {
      return;
    } else {
      var response =
          await Provider.of<FirebaseReferences>(context, listen: false)
              .auth
              .signInWithCredential(credential);

      var database =
          Provider.of<FirebaseReferences>(context, listen: false).database;

      if (response.user != null) {
        var firebaseUser =
            await database.child('users').child(response.user!.uid).once();

        if (firebaseUser.value == null) {
          await database.child('users').child(response.user!.uid).set(
            {
              "name": response.user!.displayName,
              "email": response.user!.email,
              "auth_method": 'Gmail',
            },
          );
        }

        return true;
      } else {
        return false;
      }
    }
  }

  @action
  Future<dynamic> appLogin(BuildContext context) async {
    var credential = await AppleLoginService.login();

    print(credential);

    if (credential == null) {
      return;
    } else {
      var response =
          await Provider.of<FirebaseReferences>(context, listen: false)
              .auth
              .signInWithCredential(credential);

      var database =
          Provider.of<FirebaseReferences>(context, listen: false).database;

      if (response.user != null) {
        var firebaseUser =
            await database.child('users').child(response.user!.uid).once();

        if (firebaseUser.value == null) {
          await database.child('users').child(response.user!.uid).set(
            {
              "name": response.user!.displayName,
              "email": response.user!.email,
              "auth_method": 'Apple',
            },
          );
        }

        return true;
      } else {
        return false;
      }
    }
  }

  // Validators
  emailFormValidate() {
    if (!EmailValidator.validate(emailTextForm.text)) {
      emailValidateMensage = 'Insira um email válido';
    } else {
      emailValidateMensage = '';
    }
  }

  passwordFormValidate() {
    if (passwordTextForm.text.isEmpty) {
      passwordValidateMensage = 'Campo obrigatório';
    } else {
      passwordValidateMensage = '';
    }
  }
}
