// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_recovery_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PasswordRecoveryController on _PasswordRecoveryControllerBase, Store {
  final _$pageControllerAtom =
      Atom(name: '_PasswordRecoveryControllerBase.pageController');

  @override
  PageController get pageController {
    _$pageControllerAtom.reportRead();
    return super.pageController;
  }

  @override
  set pageController(PageController value) {
    _$pageControllerAtom.reportWrite(value, super.pageController, () {
      super.pageController = value;
    });
  }

  final _$pageIndexAtom =
      Atom(name: '_PasswordRecoveryControllerBase.pageIndex');

  @override
  int get pageIndex {
    _$pageIndexAtom.reportRead();
    return super.pageIndex;
  }

  @override
  set pageIndex(int value) {
    _$pageIndexAtom.reportWrite(value, super.pageIndex, () {
      super.pageIndex = value;
    });
  }

  final _$emailTextFormAtom =
      Atom(name: '_PasswordRecoveryControllerBase.emailTextForm');

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

  final _$passwordRecoveryProgressAtom =
      Atom(name: '_PasswordRecoveryControllerBase.passwordRecoveryProgress');

  @override
  bool get passwordRecoveryProgress {
    _$passwordRecoveryProgressAtom.reportRead();
    return super.passwordRecoveryProgress;
  }

  @override
  set passwordRecoveryProgress(bool value) {
    _$passwordRecoveryProgressAtom
        .reportWrite(value, super.passwordRecoveryProgress, () {
      super.passwordRecoveryProgress = value;
    });
  }

  final _$passwordRecoveryValidateMensageAtom = Atom(
      name: '_PasswordRecoveryControllerBase.passwordRecoveryValidateMensage');

  @override
  String get passwordRecoveryValidateMensage {
    _$passwordRecoveryValidateMensageAtom.reportRead();
    return super.passwordRecoveryValidateMensage;
  }

  @override
  set passwordRecoveryValidateMensage(String value) {
    _$passwordRecoveryValidateMensageAtom
        .reportWrite(value, super.passwordRecoveryValidateMensage, () {
      super.passwordRecoveryValidateMensage = value;
    });
  }

  final _$passwordRecoveryMensageAtom =
      Atom(name: '_PasswordRecoveryControllerBase.passwordRecoveryMensage');

  @override
  String get passwordRecoveryMensage {
    _$passwordRecoveryMensageAtom.reportRead();
    return super.passwordRecoveryMensage;
  }

  @override
  set passwordRecoveryMensage(String value) {
    _$passwordRecoveryMensageAtom
        .reportWrite(value, super.passwordRecoveryMensage, () {
      super.passwordRecoveryMensage = value;
    });
  }

  final _$passwordRecoveryAsyncAction =
      AsyncAction('_PasswordRecoveryControllerBase.passwordRecovery');

  @override
  Future<dynamic> passwordRecovery(BuildContext context) {
    return _$passwordRecoveryAsyncAction
        .run(() => super.passwordRecovery(context));
  }

  final _$openEmailAppAsyncAction =
      AsyncAction('_PasswordRecoveryControllerBase.openEmailApp');

  @override
  Future openEmailApp() {
    return _$openEmailAppAsyncAction.run(() => super.openEmailApp());
  }

  final _$_PasswordRecoveryControllerBaseActionController =
      ActionController(name: '_PasswordRecoveryControllerBase');

  @override
  dynamic changePageIndex(int newPageIndex) {
    final _$actionInfo = _$_PasswordRecoveryControllerBaseActionController
        .startAction(name: '_PasswordRecoveryControllerBase.changePageIndex');
    try {
      return super.changePageIndex(newPageIndex);
    } finally {
      _$_PasswordRecoveryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic nextPage() {
    final _$actionInfo = _$_PasswordRecoveryControllerBaseActionController
        .startAction(name: '_PasswordRecoveryControllerBase.nextPage');
    try {
      return super.nextPage();
    } finally {
      _$_PasswordRecoveryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic previousPage() {
    final _$actionInfo = _$_PasswordRecoveryControllerBaseActionController
        .startAction(name: '_PasswordRecoveryControllerBase.previousPage');
    try {
      return super.previousPage();
    } finally {
      _$_PasswordRecoveryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic passwordRecoveryValidate() {
    final _$actionInfo =
        _$_PasswordRecoveryControllerBaseActionController.startAction(
            name: '_PasswordRecoveryControllerBase.passwordRecoveryValidate');
    try {
      return super.passwordRecoveryValidate();
    } finally {
      _$_PasswordRecoveryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pageController: ${pageController},
pageIndex: ${pageIndex},
emailTextForm: ${emailTextForm},
passwordRecoveryProgress: ${passwordRecoveryProgress},
passwordRecoveryValidateMensage: ${passwordRecoveryValidateMensage},
passwordRecoveryMensage: ${passwordRecoveryMensage}
    ''';
  }
}
