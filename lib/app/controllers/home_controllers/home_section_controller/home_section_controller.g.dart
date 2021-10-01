// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_section_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeSectionController on _HomeSectionControllerBase, Store {
  final _$currentUserAtom =
      Atom(name: '_HomeSectionControllerBase.currentUser');

  @override
  User? get currentUser {
    _$currentUserAtom.reportRead();
    return super.currentUser;
  }

  @override
  set currentUser(User? value) {
    _$currentUserAtom.reportWrite(value, super.currentUser, () {
      super.currentUser = value;
    });
  }

  final _$signOutAsyncAction =
      AsyncAction('_HomeSectionControllerBase.signOut');

  @override
  Future signOut(BuildContext context) {
    return _$signOutAsyncAction.run(() => super.signOut(context));
  }

  final _$_HomeSectionControllerBaseActionController =
      ActionController(name: '_HomeSectionControllerBase');

  @override
  dynamic loadCurrentUser(BuildContext context) {
    final _$actionInfo = _$_HomeSectionControllerBaseActionController
        .startAction(name: '_HomeSectionControllerBase.loadCurrentUser');
    try {
      return super.loadCurrentUser(context);
    } finally {
      _$_HomeSectionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentUser: ${currentUser}
    ''';
  }
}
