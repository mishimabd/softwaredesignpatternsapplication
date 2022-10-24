import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:softwaredesignpatternsapplication/model/model_weather.dart';

class WeatherApiClient {
  Future<Weather>? getCurrentWeather() async {
    var link = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=51.1801&lon=71.446&appid=API_KEY&units=metric");

    var response = await http.get(link);

    var body = jsonDecode(response.body);
    return Weather.fromJson(body);
  }
}
