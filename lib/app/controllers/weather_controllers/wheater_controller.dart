import 'package:app_trilhas/app/models/weather_response.dart';
import 'package:app_trilhas/app/services/weather_service/weather_service.dart';
import 'package:app_trilhas/shared/utils/api_response.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'wheater_controller.g.dart';

class WeatherController = _WeatherControllerBase with _$WeatherController;

abstract class _WeatherControllerBase with Store {
  // Observable
  @observable
  WeatherResponse? weatherResponse;

  @observable
  bool getWeatherProgress = false;

  @observable
  bool? weatherOk;

  @observable
  String? weatherTemperature;

  @observable
  String weatherMensage = 'O Tempo está meio doido hoje';

  @observable
  String weatherImagePath = 'assets/images/tornado.png';

  // Actions
  @action
  getWeather() async {
    getWeatherProgress = true;
    ApiResponse response = await WeatherService.getWeather();
    getWeatherProgress = false;

    if (response.ok!) {
      weatherResponse = response.result;
      weatherTemperature =
          (weatherResponse!.main!.temp! - 273.15).toStringAsFixed(0);
      weatherLogicCalcule();
      weatherOk = true;
    } else {
      weatherOk = false;
    }
  }

  @action
  weatherLogicCalcule() {
    TimeOfDay now = TimeOfDay.now();
    int nowInMinutes = now.hour * 60 + now.minute;
    print(nowInMinutes);

    TimeOfDay h00 = TimeOfDay(hour: 23, minute: 59);
    int h00InMinutes = h00.hour * 60 + h00.minute;
    print(h00InMinutes);

    TimeOfDay h16 = TimeOfDay(hour: 16, minute: 00);
    int h16InMinutes = h16.hour * 60 + h16.minute;
    print(h16InMinutes);

    TimeOfDay h001 = TimeOfDay(hour: 00, minute: 00);
    int h001InMinutes = h001.hour * 60 + h001.minute;
    print(h001InMinutes);

    TimeOfDay h08 = TimeOfDay(hour: 08, minute: 00);
    int h08InMinutes = h08.hour * 60 + h08.minute;
    print(h08InMinutes);

    if (nowInMinutes > h16InMinutes && nowInMinutes < h00InMinutes) {
      weatherMensage = 'Hora de recarregar as energias';
      weatherImagePath = 'assets/images/moon.png';
    } else if (nowInMinutes > h001InMinutes && nowInMinutes < h08InMinutes) {
      weatherMensage = 'Já já tem trilhas e opções de ecoturismo';
      weatherImagePath = 'assets/images/sunrise.png';
    } else if (weatherResponse!.weather![0].main == 'Clear') {
      weatherMensage = 'Dia ensolarado, bora pra trilha!';
      weatherImagePath = 'assets/images/icon_sun.png';
    } else if (weatherResponse!.weather![0].main == 'Clouds') {
      weatherMensage = 'Dia nublado, bom que o sol não está forte.';
      weatherImagePath = 'assets/images/cloud-day.png';
    } else if (weatherResponse!.weather![0].main == 'Rain' ||
        weatherResponse!.weather![0].main == 'Drizzle') {
      weatherMensage = 'Dia chuvoso, não esqueça a capa!';
      weatherImagePath = 'assets/images/rainy.png';
    }
  }
}
