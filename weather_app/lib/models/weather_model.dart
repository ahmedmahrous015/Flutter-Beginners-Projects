import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;

  WeatherModel({
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherStateName,
  });

  factory WeatherModel.fromJson(dynamic data) {
    return WeatherModel(
      date: data['list'][0]['dt_txt'],
      temp: data['list'][0]['main']['temp'],
      maxTemp: data['list'][0]['main']['temp_max'],
      minTemp: data['list'][0]['main']['temp_min'],
      weatherStateName: data['list'][0]['weather'][0]['description'],
    );
  }
  @override
  String toString() {
    return ('minTemp:${(minTemp - 273.15).toInt()}\u2103 temp:${(temp - 273.15).toInt()}\u2103');
  }

  String getImage() {
    if (weatherStateName == 'Sunny' ||
        weatherStateName == 'Clear' ||
        weatherStateName == 'partly cloudy') {
      return 'assets/images/clear.png';
    } else if (weatherStateName == 'Blizzard' ||
        weatherStateName == 'Patchy snow possible' ||
        weatherStateName == 'Patchy sleet possible' ||
        weatherStateName == 'Patchy freezing drizzle possible' ||
        weatherStateName == 'Blowing snow') {
      return 'assets/images/snow.png';
    } else if (weatherStateName == 'Freezing fog' ||
        weatherStateName == 'Fog' ||
        weatherStateName == 'Heavy Cloud' ||
        weatherStateName == 'Mist' ||
        weatherStateName == 'Fog') {
      return 'assets/images/cloudy.png';
    } else if (weatherStateName == 'Patchy rain possible' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers	') {
      return 'assets/images/rainy.png';
    } else if (weatherStateName == 'Thundery outbreaks possible' ||
        weatherStateName == 'Moderate or heavy snow with thunder' ||
        weatherStateName == 'Patchy light snow with thunder' ||
        weatherStateName == 'Moderate or heavy rain with thunder' ||
        weatherStateName == 'Patchy light rain with thunder') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getThemeColor() {
    if (weatherStateName == 'Sunny' || weatherStateName == 'Clear' ||  weatherStateName == 'broken clouds') {
      return Colors.orange;
    } else if (
        
        weatherStateName == 'Blizzard' ||  weatherStateName == 'Patchy snow possible'  ||  weatherStateName == 'Patchy sleet possible' || weatherStateName == 'Patchy freezing drizzle possible' || weatherStateName == 'Blowing snow') {
      return Colors.blue;
    } else if (weatherStateName == 'Freezing fog' || weatherStateName == 'Fog' ||  weatherStateName == 'Heavy Cloud' || weatherStateName == 'Mist' || weatherStateName == 'Fog') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Patchy rain possible' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers	') {
      return Colors.blue;
    } else if (weatherStateName == 'Thundery outbreaks possible' || weatherStateName == 'Moderate or heavy snow with thunder' || weatherStateName == 'Patchy light snow with thunder'|| weatherStateName == 'Moderate or heavy rain with thunder' || weatherStateName == 'Patchy light rain with thunder' ) {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }
}
