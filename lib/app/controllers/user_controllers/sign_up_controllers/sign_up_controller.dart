import 'package:app_trilhas/app/models/user.dart';
import 'package:app_trilhas/app/services/user_services/sign_up_service.dart';
import 'package:app_trilhas/shared/utils/api_response.dart';
import 'package:app_trilhas/shared/validations/validations.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:open_mail_app/open_mail_app.dart';

part 'sign_up_controller.g.dart';

class SignUpController = _SignUpControllerBase with _$SignUpController;

abstract class _SignUpControllerBase with Store {
  //Observables

  @observable
  TextEditingController nameTextForm = TextEditingController();

  @observable
  TextEditingController birthDateTextForm = TextEditingController();

  @observable
  TextEditingController cityTextForm = TextEditingController();

  @observable
  TextEditingController emailTextForm = TextEditingController();

  @observable
  TextEditingController passwordTextForm = TextEditingController();

  @observable
  TextEditingController repeatedPasswordTextForm = TextEditingController();

  @observable
  bool? signUpFormIsValid;

  @observable
  bool signUpProgress = false;

  @observable
  String nameValidateMensage = '';

  @observable
  String birthDateValidateMensage = '';

  @observable
  String emailValidateMensage = '';

  @observable
  String passwordValidateMensage = '';

  @observable
  String repeatedPasswordValidateMensage = '';

  @observable
  String signUpMensage = '';

  //Actions

  @action
  checkIfSignUpFormIsValid() {
    nameValidator();
    birthDateValidator();
    emailValidator();
    passwordValidator();
    repeatedPasswordValidator();

    if (nameValidateMensage.isEmpty &&
        birthDateValidateMensage.isEmpty &&
        emailValidateMensage.isEmpty &&
        passwordValidateMensage.isEmpty &&
        repeatedPasswordValidateMensage.isEmpty) {
      signUpFormIsValid = true;
    } else {
      signUpFormIsValid = false;
    }
  }

  @action
  clearFields() {
    nameTextForm.text = '';
    birthDateTextForm.text = '';
    emailTextForm.text = '';
    passwordTextForm.text = '';
    repeatedPasswordTextForm.text = '';
  }

  @action
  openEmailApp() async {
    var result = await OpenMailApp.openMailApp();

    MailAppPickerDialog(
      mailApps: result.options,
    );
  }

  @action
  Future<dynamic> signUp(BuildContext context) async {
    checkIfSignUpFormIsValid();
    print(birthDateTextForm.text);
    if (signUpFormIsValid!) {
      User user = User();

      user.name = nameTextForm.text;
      user.birthDate = birthDateTextForm.text;
      user.email = emailTextForm.text;
      user.password = passwordTextForm.text;

      signUpProgress = true;
      ApiResponse response = await SignUpService.signUp(user, context);
      signUpProgress = false;

      if (response.ok == true) {
        signUpMensage = 'Cadastro concluído com sucesso!';
        clearFields();
        return true;
      } else {
        signUpMensage = response.msg!;
        return false;
      }
    }
  }

  //Validators
  @action
  nameValidator() {
    nameValidateMensage = Validations.nameValidator(nameTextForm.text);
  }

  @action
  birthDateValidator() {
    birthDateValidateMensage = Validations.birthDateValidator(
      birthDateTextForm.text,
    );
  }

  @action
  emailValidator() {
    emailValidateMensage = Validations.emailValidator(emailTextForm.text);
  }

  @action
  passwordValidator() {
    passwordValidateMensage =
        Validations.passwordValidator(passwordTextForm.text);
  }

  @action
  repeatedPasswordValidator() {
    repeatedPasswordValidateMensage = Validations.repeatedPasswordValidator(
        passwordTextForm.text, repeatedPasswordTextForm.text);
  }
}
