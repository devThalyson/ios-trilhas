// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trail_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TrailController on _TrailControllerBase, Store {
  final _$trailsAtom = Atom(name: '_TrailControllerBase.trails');

  @override
  List<Trail> get trails {
    _$trailsAtom.reportRead();
    return super.trails;
  }

  @override
  set trails(List<Trail> value) {
    _$trailsAtom.reportWrite(value, super.trails, () {
      super.trails = value;
    });
  }

  final _$ecotourismsAtom = Atom(name: '_TrailControllerBase.ecotourisms');

  @override
  List<Ecotourism> get ecotourisms {
    _$ecotourismsAtom.reportRead();
    return super.ecotourisms;
  }

  @override
  set ecotourisms(List<Ecotourism> value) {
    _$ecotourismsAtom.reportWrite(value, super.ecotourisms, () {
      super.ecotourisms = value;
    });
  }

  final _$getTrailsProgressAtom =
      Atom(name: '_TrailControllerBase.getTrailsProgress');

  @override
  bool get getTrailsProgress {
    _$getTrailsProgressAtom.reportRead();
    return super.getTrailsProgress;
  }

  @override
  set getTrailsProgress(bool value) {
    _$getTrailsProgressAtom.reportWrite(value, super.getTrailsProgress, () {
      super.getTrailsProgress = value;
    });
  }

  final _$carrouselIndexAtom =
      Atom(name: '_TrailControllerBase.carrouselIndex');

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

  final _$trailsInfoBodyTopMargingAtom =
      Atom(name: '_TrailControllerBase.trailsInfoBodyTopMarging');

  @override
  double get trailsInfoBodyTopMarging {
    _$trailsInfoBodyTopMargingAtom.reportRead();
    return super.trailsInfoBodyTopMarging;
  }

  @override
  set trailsInfoBodyTopMarging(double value) {
    _$trailsInfoBodyTopMargingAtom
        .reportWrite(value, super.trailsInfoBodyTopMarging, () {
      super.trailsInfoBodyTopMarging = value;
    });
  }

  final _$scrollControllerAtom =
      Atom(name: '_TrailControllerBase.scrollController');

  @override
  ScrollController get scrollController {
    _$scrollControllerAtom.reportRead();
    return super.scrollController;
  }

  @override
  set scrollController(ScrollController value) {
    _$scrollControllerAtom.reportWrite(value, super.scrollController, () {
      super.scrollController = value;
    });
  }

  final _$shareTrailAsyncAction =
      AsyncAction('_TrailControllerBase.shareTrail');

  @override
  Future shareTrail(BuildContext context, String imageUrl, Trail trail) {
    return _$shareTrailAsyncAction
        .run(() => super.shareTrail(context, imageUrl, trail));
  }

  final _$_TrailControllerBaseActionController =
      ActionController(name: '_TrailControllerBase');

  @override
  dynamic getTrails(BuildContext context) {
    final _$actionInfo = _$_TrailControllerBaseActionController.startAction(
        name: '_TrailControllerBase.getTrails');
    try {
      return super.getTrails(context);
    } finally {
      _$_TrailControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic catchCarrouselIndex(int value) {
    final _$actionInfo = _$_TrailControllerBaseActionController.startAction(
        name: '_TrailControllerBase.catchCarrouselIndex');
    try {
      return super.catchCarrouselIndex(value);
    } finally {
      _$_TrailControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
trails: ${trails},
ecotourisms: ${ecotourisms},
getTrailsProgress: ${getTrailsProgress},
carrouselIndex: ${carrouselIndex},
trailsInfoBodyTopMarging: ${trailsInfoBodyTopMarging},
scrollController: ${scrollController}
    ''';
  }
}
