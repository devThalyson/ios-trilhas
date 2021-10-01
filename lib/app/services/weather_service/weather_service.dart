import 'package:app_trilhas/app/models/weather_response.dart';
import 'package:app_trilhas/shared/utils/api_response.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class WeatherService {
  static Future<ApiResponse<WeatherResponse>> getWeather() async {
    try {
      String stringUrl =
          'https://api.openweathermap.org/data/2.5/weather?q=itapema&appid=085cc2c15b66d4a76ce3030cf52a27e4';
      var url = Uri.parse(stringUrl);

      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      var response = await http.get(url, headers: headers);

      print(response.body);

      Map<String, dynamic> mapResponse = convert.json.decode(response.body);

      final weatherResponse = WeatherResponse.fromJson(mapResponse);

      return ApiResponse.ok(weatherResponse);
    } catch (error) {
      print(error);
      return ApiResponse.error(
          "Verifique sua conexão com a internet ou tente novamente mais tarde");
    }
  }
}
