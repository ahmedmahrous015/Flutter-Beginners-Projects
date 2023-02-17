import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  String baseUrl = 'https://api.openweathermap.org/data/2.5';
  String apiKey = '15adc5c52edb8f6dfc1d69cea5d1fa4e';
  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weather;
    try {
      Uri url = Uri.parse('$baseUrl/forecast?q=$cityName&appid=$apiKey');
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);

      weather = WeatherModel.fromJson(data);
    } catch (e) {
      print(e);
    }

    return weather;
  }
}
