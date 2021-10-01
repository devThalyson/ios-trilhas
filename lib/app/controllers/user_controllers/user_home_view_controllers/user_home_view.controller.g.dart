// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_home_view.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserHomeViewController on _UserHomeViewControllerBase, Store {
  final _$logoBarResizeAtom =
      Atom(name: '_UserHomeViewControllerBase.logoBarResize');

  @override
  bool get logoBarResize {
    _$logoBarResizeAtom.reportRead();
    return super.logoBarResize;
  }

  @override
  set logoBarResize(bool value) {
    _$logoBarResizeAtom.reportWrite(value, super.logoBarResize, () {
      super.logoBarResize = value;
    });
  }

  final _$segmentIndexAtom =
      Atom(name: '_UserHomeViewControllerBase.segmentIndex');

  @override
  int get segmentIndex {
    _$segmentIndexAtom.reportRead();
    return super.segmentIndex;
  }

  @override
  set segmentIndex(int value) {
    _$segmentIndexAtom.reportWrite(value, super.segmentIndex, () {
      super.segmentIndex = value;
    });
  }

  final _$_UserHomeViewControllerBaseActionController =
      ActionController(name: '_UserHomeViewControllerBase');

  @override
  dynamic changeSegmentIndex(
      int newSegmentIndex,
      AnimationController animationController1,
      AnimationController animationController2) {
    final _$actionInfo = _$_UserHomeViewControllerBaseActionController
        .startAction(name: '_UserHomeViewControllerBase.changeSegmentIndex');
    try {
      return super.changeSegmentIndex(
          newSegmentIndex, animationController1, animationController2);
    } finally {
      _$_UserHomeViewControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
logoBarResize: ${logoBarResize},
segmentIndex: ${segmentIndex}
    ''';
  }
}
