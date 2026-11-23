import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:learning_bloc/data/repository/weather_repository.dart';

import '../models/weather_model.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository repository;
  WeatherBloc(this.repository) : super(WeatherInitial()) {
    on<WeatherFetch>(_getWeather);
  }

  void _getWeather(WeatherEvent event, Emitter<WeatherState> emit) async{
    emit(WeatherLoading());
    try {
      final weatherModel = await repository.getWeatherData(city: 'Haldwani');
      emit(WeatherSuccess(weatherModel));
    } catch(error) {
      emit(WeatherFailure(error.toString()));
    }
  }
}
