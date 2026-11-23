import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/bloc/weather_bloc.dart';
import 'package:learning_bloc/data/data_layer/weather_data.dart';
import 'package:learning_bloc/data/repository/weather_repository.dart';
import 'package:learning_bloc/presentation/screens/weather_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => WeatherRepository(WeatherData()),
      child: BlocProvider(
        create: (context) => WeatherBloc(context.read<WeatherRepository>()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: .fromSeed(
              brightness: .dark,
              seedColor: Colors.deepPurple,
            ),
          ),
          home: const WeatherScreen(),
        ),
      ),
    );
  }
}
