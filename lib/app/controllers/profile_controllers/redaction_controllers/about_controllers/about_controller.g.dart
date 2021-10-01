// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AboutController on _AboutControllerBase, Store {
  final _$getAboutProgressAtom =
      Atom(name: '_AboutControllerBase.getAboutProgress');

  @override
  bool get getAboutProgress {
    _$getAboutProgressAtom.reportRead();
    return super.getAboutProgress;
  }

  @override
  set getAboutProgress(bool value) {
    _$getAboutProgressAtom.reportWrite(value, super.getAboutProgress, () {
      super.getAboutProgress = value;
    });
  }

  final _$aboutAtom = Atom(name: '_AboutControllerBase.about');

  @override
  About? get about {
    _$aboutAtom.reportRead();
    return super.about;
  }

  @override
  set about(About? value) {
    _$aboutAtom.reportWrite(value, super.about, () {
      super.about = value;
    });
  }

  final _$getAboutAsyncAction = AsyncAction('_AboutControllerBase.getAbout');

  @override
  Future getAbout(BuildContext context) {
    return _$getAboutAsyncAction.run(() => super.getAbout(context));
  }

  @override
  String toString() {
    return '''
getAboutProgress: ${getAboutProgress},
about: ${about}
    ''';
  }
}
