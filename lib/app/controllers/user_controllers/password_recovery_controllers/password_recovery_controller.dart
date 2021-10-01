import 'package:app_trilhas/shared/utils/firebase_references.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:open_mail_app/open_mail_app.dart';
import 'package:provider/provider.dart';
part 'password_recovery_controller.g.dart';

class PasswordRecoveryController = _PasswordRecoveryControllerBase
    with _$PasswordRecoveryController;

abstract class _PasswordRecoveryControllerBase with Store {
  // Observables

  @observable
  PageController pageController = PageController(
    initialPage: 0,
  );

  @observable
  int pageIndex = 0;

  @observable
  TextEditingController emailTextForm = TextEditingController();

  @observable
  bool passwordRecoveryProgress = false;

  @observable
  String passwordRecoveryValidateMensage = '';

  @observable
  String passwordRecoveryMensage = '';

  // Actions

  @action
  changePageIndex(int newPageIndex) {
    pageIndex = newPageIndex;
  }

  @action
  nextPage() {
    pageController.nextPage(
      duration: Duration(
        seconds: 1,
      ),
      curve: Curves.easeOutSine,
    );
  }

  @action
  previousPage() {
    pageController.previousPage(
      duration: Duration(
        seconds: 1,
      ),
      curve: Curves.easeOutSine,
    );
  }

  @action
  Future<dynamic> passwordRecovery(BuildContext context) async {
    passwordRecoveryValidate();

    if (passwordRecoveryValidateMensage.isEmpty) {
      passwordRecoveryProgress = true;
      try {
        await Provider.of<FirebaseReferences>(context, listen: false)
            .auth
            .sendPasswordResetEmail(email: emailTextForm.text);

        emailTextForm.text = '';

        passwordRecoveryProgress = false;

        return true;
      } on FirebaseException catch (e) {
        if (e.toString().contains('user-not-found')) {
          passwordRecoveryMensage =
              'Não existe um usuário cadastrado com o e-mail informado';
        } else {
          passwordRecoveryMensage =
              'Verifique sua conexão com a internet ou tente novamente mais tarde';
        }

        emailTextForm.text = '';

        passwordRecoveryProgress = false;

        return false;
      }
    }
  }

  @action
  openEmailApp() async {
    var result = await OpenMailApp.openMailApp();

    MailAppPickerDialog(
      mailApps: result.options,
    );
  }

  // Validators
  @action
  passwordRecoveryValidate() {
    if (!EmailValidator.validate(emailTextForm.text)) {
      passwordRecoveryValidateMensage = 'Insira um email válido';
    } else {
      passwordRecoveryValidateMensage = '';
    }
  }
}
