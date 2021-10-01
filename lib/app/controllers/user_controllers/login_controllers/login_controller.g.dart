// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  final _$emailTextFormAtom = Atom(name: '_LoginControllerBase.emailTextForm');

  @override
  TextEditingController get emailTextForm {
    _$emailTextFormAtom.reportRead();
    return super.emailTextForm;
  }

  @override
  set emailTextForm(TextEditingController value) {
    _$emailTextFormAtom.reportWrite(value, super.emailTextForm, () {
      super.emailTextForm = value;
    });
  }

  final _$passwordTextFormAtom =
      Atom(name: '_LoginControllerBase.passwordTextForm');

  @override
  TextEditingController get passwordTextForm {
    _$passwordTextFormAtom.reportRead();
    return super.passwordTextForm;
  }

  @override
  set passwordTextForm(TextEditingController value) {
    _$passwordTextFormAtom.reportWrite(value, super.passwordTextForm, () {
      super.passwordTextForm = value;
    });
  }

  final _$loginFormIsValidAtom =
      Atom(name: '_LoginControllerBase.loginFormIsValid');

  @override
  bool? get loginFormIsValid {
    _$loginFormIsValidAtom.reportRead();
    return super.loginFormIsValid;
  }

  @override
  set loginFormIsValid(bool? value) {
    _$loginFormIsValidAtom.reportWrite(value, super.loginFormIsValid, () {
      super.loginFormIsValid = value;
    });
  }

  final _$loginProgressAtom = Atom(name: '_LoginControllerBase.loginProgress');

  @override
  bool get loginProgress {
    _$loginProgressAtom.reportRead();
    return super.loginProgress;
  }

  @override
  set loginProgress(bool value) {
    _$loginProgressAtom.reportWrite(value, super.loginProgress, () {
      super.loginProgress = value;
    });
  }

  final _$emailValidateMensageAtom =
      Atom(name: '_LoginControllerBase.emailValidateMensage');

  @override
  String get emailValidateMensage {
    _$emailValidateMensageAtom.reportRead();
    return super.emailValidateMensage;
  }

  @override
  set emailValidateMensage(String value) {
    _$emailValidateMensageAtom.reportWrite(value, super.emailValidateMensage,
        () {
      super.emailValidateMensage = value;
    });
  }

  final _$passwordValidateMensageAtom =
      Atom(name: '_LoginControllerBase.passwordValidateMensage');

  @override
  String get passwordValidateMensage {
    _$passwordValidateMensageAtom.reportRead();
    return super.passwordValidateMensage;
  }

  @override
  set passwordValidateMensage(String value) {
    _$passwordValidateMensageAtom
        .reportWrite(value, super.passwordValidateMensage, () {
      super.passwordValidateMensage = value;
    });
  }

  final _$loginMensageAtom = Atom(name: '_LoginControllerBase.loginMensage');

  @override
  String get loginMensage {
    _$loginMensageAtom.reportRead();
    return super.loginMensage;
  }

  @override
  set loginMensage(String value) {
    _$loginMensageAtom.reportWrite(value, super.loginMensage, () {
      super.loginMensage = value;
    });
  }

  final _$emailLoginAsyncAction =
      AsyncAction('_LoginControllerBase.emailLogin');

  @override
  Future<dynamic> emailLogin(BuildContext context) {
    return _$emailLoginAsyncAction.run(() => super.emailLogin(context));
  }

  final _$facebookLoginAsyncAction =
      AsyncAction('_LoginControllerBase.facebookLogin');

  @override
  Future<dynamic> facebookLogin(BuildContext context) {
    return _$facebookLoginAsyncAction.run(() => super.facebookLogin(context));
  }

  final _$googleLoginAsyncAction =
      AsyncAction('_LoginControllerBase.googleLogin');

  @override
  Future<dynamic> googleLogin(BuildContext context) {
    return _$googleLoginAsyncAction.run(() => super.googleLogin(context));
  }

  final _$appLoginAsyncAction = AsyncAction('_LoginControllerBase.appLogin');

  @override
  Future<dynamic> appLogin(BuildContext context) {
    return _$appLoginAsyncAction.run(() => super.appLogin(context));
  }

  final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase');

  @override
  dynamic checkIfLoginFormIsValid() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.checkIfLoginFormIsValid');
    try {
      return super.checkIfLoginFormIsValid();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearFields() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.clearFields');
    try {
      return super.clearFields();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
emailTextForm: ${emailTextForm},
passwordTextForm: ${passwordTextForm},
loginFormIsValid: ${loginFormIsValid},
loginProgress: ${loginProgress},
emailValidateMensage: ${emailValidateMensage},
passwordValidateMensage: ${passwordValidateMensage},
loginMensage: ${loginMensage}
    ''';
  }
}
