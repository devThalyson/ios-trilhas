// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ContactController on _ContactControllerBase, Store {
  final _$contactTextFormAtom =
      Atom(name: '_ContactControllerBase.contactTextForm');

  @override
  TextEditingController get contactTextForm {
    _$contactTextFormAtom.reportRead();
    return super.contactTextForm;
  }

  @override
  set contactTextForm(TextEditingController value) {
    _$contactTextFormAtom.reportWrite(value, super.contactTextForm, () {
      super.contactTextForm = value;
    });
  }

  final _$sendEmailValidateMensageAtom =
      Atom(name: '_ContactControllerBase.sendEmailValidateMensage');

  @override
  String get sendEmailValidateMensage {
    _$sendEmailValidateMensageAtom.reportRead();
    return super.sendEmailValidateMensage;
  }

  @override
  set sendEmailValidateMensage(String value) {
    _$sendEmailValidateMensageAtom
        .reportWrite(value, super.sendEmailValidateMensage, () {
      super.sendEmailValidateMensage = value;
    });
  }

  final _$sendEmailProgressAtom =
      Atom(name: '_ContactControllerBase.sendEmailProgress');

  @override
  bool get sendEmailProgress {
    _$sendEmailProgressAtom.reportRead();
    return super.sendEmailProgress;
  }

  @override
  set sendEmailProgress(bool value) {
    _$sendEmailProgressAtom.reportWrite(value, super.sendEmailProgress, () {
      super.sendEmailProgress = value;
    });
  }

  final _$sendEmailAsyncAction =
      AsyncAction('_ContactControllerBase.sendEmail');

  @override
  Future sendEmail() {
    return _$sendEmailAsyncAction.run(() => super.sendEmail());
  }

  final _$_ContactControllerBaseActionController =
      ActionController(name: '_ContactControllerBase');

  @override
  dynamic sendEmailValidator() {
    final _$actionInfo = _$_ContactControllerBaseActionController.startAction(
        name: '_ContactControllerBase.sendEmailValidator');
    try {
      return super.sendEmailValidator();
    } finally {
      _$_ContactControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
contactTextForm: ${contactTextForm},
sendEmailValidateMensage: ${sendEmailValidateMensage},
sendEmailProgress: ${sendEmailProgress}
    ''';
  }
}
