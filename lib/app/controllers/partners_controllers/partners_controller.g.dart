// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partners_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PartnersController on _PartnersControllerBase, Store {
  final _$partnersAtom = Atom(name: '_PartnersControllerBase.partners');

  @override
  List<Partner> get partners {
    _$partnersAtom.reportRead();
    return super.partners;
  }

  @override
  set partners(List<Partner> value) {
    _$partnersAtom.reportWrite(value, super.partners, () {
      super.partners = value;
    });
  }

  final _$getPartnersProgressAtom =
      Atom(name: '_PartnersControllerBase.getPartnersProgress');

  @override
  bool get getPartnersProgress {
    _$getPartnersProgressAtom.reportRead();
    return super.getPartnersProgress;
  }

  @override
  set getPartnersProgress(bool value) {
    _$getPartnersProgressAtom.reportWrite(value, super.getPartnersProgress, () {
      super.getPartnersProgress = value;
    });
  }

  final _$getPartnersAsyncAction =
      AsyncAction('_PartnersControllerBase.getPartners');

  @override
  Future getPartners(BuildContext context) {
    return _$getPartnersAsyncAction.run(() => super.getPartners(context));
  }

  @override
  String toString() {
    return '''
partners: ${partners},
getPartnersProgress: ${getPartnersProgress}
    ''';
  }
}
