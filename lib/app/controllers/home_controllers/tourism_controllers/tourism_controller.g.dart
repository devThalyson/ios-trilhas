// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tourism_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TourismController on _TourismControllerBase, Store {
  final _$carrouselIndexAtom =
      Atom(name: '_TourismControllerBase.carrouselIndex');

  @override
  int get carrouselIndex {
    _$carrouselIndexAtom.reportRead();
    return super.carrouselIndex;
  }

  @override
  set carrouselIndex(int value) {
    _$carrouselIndexAtom.reportWrite(value, super.carrouselIndex, () {
      super.carrouselIndex = value;
    });
  }

  final _$shareTourismAsyncAction =
      AsyncAction('_TourismControllerBase.shareTourism');

  @override
  Future shareTourism(
      BuildContext context, String imageUrl, Ecotourism tourism) {
    return _$shareTourismAsyncAction
        .run(() => super.shareTourism(context, imageUrl, tourism));
  }

  final _$_TourismControllerBaseActionController =
      ActionController(name: '_TourismControllerBase');

  @override
  dynamic catchCarrouselIndex(int value) {
    final _$actionInfo = _$_TourismControllerBaseActionController.startAction(
        name: '_TourismControllerBase.catchCarrouselIndex');
    try {
      return super.catchCarrouselIndex(value);
    } finally {
      _$_TourismControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
carrouselIndex: ${carrouselIndex}
    ''';
  }
}
