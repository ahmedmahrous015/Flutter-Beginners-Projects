import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/service/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherService weatherService;
  WeatherModel? weatherModel;
  String? cityName;

  WeatherCubit(this.weatherService) : super(WeatherInitialState());

  void getWeather({required String cityName}) async {
    emit(WeatherLoadingState());
    try {
      weatherModel = await weatherService.getWeather(cityName: cityName);
      emit(WeatherSuccesState());
    } on Exception catch (e) {
      emit(WeatherfailureState());
    }
  }
}
