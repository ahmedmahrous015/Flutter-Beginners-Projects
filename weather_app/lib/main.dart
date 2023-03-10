import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/service/weather_service.dart';


void main() {
  runApp(
    BlocProvider(
      create: (context) {
        return WeatherCubit(WeatherService());
      },
      child: WeatherApp(),
    ),
  );
}

// ignore: must_be_immutable
class WeatherApp extends StatelessWidget {
  WeatherApp({Key? key}) : super(key: key);
  WeatherModel? weather;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       primarySwatch:BlocProvider.of<WeatherCubit>(context).weatherModel==null ? Colors.blue: BlocProvider.of<WeatherCubit>(context).weatherModel!.getThemeColor(),
      ),
      home: HomePage(),
    );
  }
}
