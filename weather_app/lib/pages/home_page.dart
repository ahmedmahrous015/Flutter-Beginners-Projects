import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/cubits/weather_cubit.dart';
import 'package:weather_app/cubits/weather_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchPage();
              }));
            },
            icon: Icon(Icons.search),
          ),
        ],
        title: Text('Weather App'),
      ),
      body: BlocBuilder<WeatherCubit,WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoadingState) {
            return Center(child: CircularProgressIndicator());
            
          } else if (state is WeatherSuccesState) {
            weatherData = BlocProvider.of<WeatherCubit>(context).weatherModel;
            return SuceessBody(weatherData: weatherData);
          } else if (state is WeatherfailureState) {
            return Center(child: Text('Something went wrong please try again'));
          } else {
            return DefaultBody();
          }
        },
      ),
    );
  }
}

class DefaultBody extends StatelessWidget {
  const DefaultBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'there is no weather 😔 start',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Text(
            'searching now 🔍',
            style: TextStyle(
              fontSize: 30,
            ),
          )
        ],
      ),
    );
  }
}

class SuceessBody extends StatelessWidget {
   SuceessBody({
    Key? key,
    required this.weatherData,
  }) : super(key: key);

   WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            weatherData!.getThemeColor(),
            weatherData!.getThemeColor()[300]!,
            weatherData!.getThemeColor()[100]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(
            flex: 3,
          ),
          Text(
            
            BlocProvider.of<WeatherCubit>(context).cityName!,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            DateFormat().add_MMMMEEEEd().format(
                  DateTime.now(),
                ),
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(weatherData!.getImage()),
              Text(
                '${(weatherData!.temp - 273.15).toInt()}\u2103',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: [
                  Text(
                    'Maxtemp:${(weatherData!.maxTemp - 273.15).toInt()}\u2103',
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Mintemp:${(weatherData!.minTemp - 273.15).toInt()}\u2103',
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          Text(
            weatherData!.weatherStateName,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(
            flex: 5,
          ),
        ],
      ),
    );
  }
}
