import 'dart:convert';

import 'package:learning_bloc/data/data_layer/weather_data.dart';
import 'package:learning_bloc/models/weather_model.dart';

class WeatherRepository {
  final WeatherData weatherData;
  WeatherRepository(this.weatherData);

  Future<WeatherModel> getWeatherData({required String city}) async{
    try {
      final response = await weatherData.getWeatherData(city: city);
      return WeatherModel.fromJson(jsonDecode(response));
    } catch(error) {
      rethrow;
    }
  }
}