// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wheater_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WeatherController on _WeatherControllerBase, Store {
  final _$weatherResponseAtom =
      Atom(name: '_WeatherControllerBase.weatherResponse');

  @override
  WeatherResponse? get weatherResponse {
    _$weatherResponseAtom.reportRead();
    return super.weatherResponse;
  }

  @override
  set weatherResponse(WeatherResponse? value) {
    _$weatherResponseAtom.reportWrite(value, super.weatherResponse, () {
      super.weatherResponse = value;
    });
  }

  final _$getWeatherProgressAtom =
      Atom(name: '_WeatherControllerBase.getWeatherProgress');

  @override
  bool get getWeatherProgress {
    _$getWeatherProgressAtom.reportRead();
    return super.getWeatherProgress;
  }

  @override
  set getWeatherProgress(bool value) {
    _$getWeatherProgressAtom.reportWrite(value, super.getWeatherProgress, () {
      super.getWeatherProgress = value;
    });
  }

  final _$weatherOkAtom = Atom(name: '_WeatherControllerBase.weatherOk');

  @override
  bool? get weatherOk {
    _$weatherOkAtom.reportRead();
    return super.weatherOk;
  }

  @override
  set weatherOk(bool? value) {
    _$weatherOkAtom.reportWrite(value, super.weatherOk, () {
      super.weatherOk = value;
    });
  }

  final _$weatherTemperatureAtom =
      Atom(name: '_WeatherControllerBase.weatherTemperature');

  @override
  String? get weatherTemperature {
    _$weatherTemperatureAtom.reportRead();
    return super.weatherTemperature;
  }

  @override
  set weatherTemperature(String? value) {
    _$weatherTemperatureAtom.reportWrite(value, super.weatherTemperature, () {
      super.weatherTemperature = value;
    });
  }

  final _$weatherMensageAtom =
      Atom(name: '_WeatherControllerBase.weatherMensage');

  @override
  String get weatherMensage {
    _$weatherMensageAtom.reportRead();
    return super.weatherMensage;
  }

  @override
  set weatherMensage(String value) {
    _$weatherMensageAtom.reportWrite(value, super.weatherMensage, () {
      super.weatherMensage = value;
    });
  }

  final _$weatherImagePathAtom =
      Atom(name: '_WeatherControllerBase.weatherImagePath');

  @override
  String get weatherImagePath {
    _$weatherImagePathAtom.reportRead();
    return super.weatherImagePath;
  }

  @override
  set weatherImagePath(String value) {
    _$weatherImagePathAtom.reportWrite(value, super.weatherImagePath, () {
      super.weatherImagePath = value;
    });
  }

  final _$getWeatherAsyncAction =
      AsyncAction('_WeatherControllerBase.getWeather');

  @override
  Future getWeather() {
    return _$getWeatherAsyncAction.run(() => super.getWeather());
  }

  final _$_WeatherControllerBaseActionController =
      ActionController(name: '_WeatherControllerBase');

  @override
  dynamic weatherLogicCalcule() {
    final _$actionInfo = _$_WeatherControllerBaseActionController.startAction(
        name: '_WeatherControllerBase.weatherLogicCalcule');
    try {
      return super.weatherLogicCalcule();
    } finally {
      _$_WeatherControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
weatherResponse: ${weatherResponse},
getWeatherProgress: ${getWeatherProgress},
weatherOk: ${weatherOk},
weatherTemperature: ${weatherTemperature},
weatherMensage: ${weatherMensage},
weatherImagePath: ${weatherImagePath}
    ''';
  }
}
