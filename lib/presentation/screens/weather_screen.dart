import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/bloc/weather_bloc.dart';
import 'package:learning_bloc/presentation/widgets/weather_additional_info.dart';
import 'package:learning_bloc/presentation/widgets/weather_details_card.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherBloc>().add(WeatherFetch());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Weather App'),
            actions: [
              IconButton(
                icon: Icon(Icons.restart_alt_sharp),
                onPressed: () {
                  context.read<WeatherBloc>().add(WeatherFetch());
                },
              ),
            ],
          ),
          body: Padding(
            padding: .all(25),
            child: BlocConsumer<WeatherBloc, WeatherState>(
              listener: (context, state) {
                if (state is WeatherFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.error), showCloseIcon: true),
                  );
                }
              },
              builder: (context, state) {
                if (state is WeatherLoading || state is WeatherInitial) {
                  return Center(child: CircularProgressIndicator());
                }

                return Column(
                  children: [
                    ///weather card
                    WeatherDetailsCard(
                      description: (state as WeatherSuccess).weatherModel.desc,
                      temperature: state.weatherModel.temperature,
                    ),
                    const SizedBox(height: 25,),

                    /// additional information
                    // text
                    SizedBox(
                      width: .infinity,
                      child: Text(
                        'Additional Information',
                        style: TextStyle(fontSize: 22),
                        textAlign: .start,
                      ),
                    ),
                    const SizedBox(height: 10,),

                    //humidity, wind, pressure widgets in row
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        WeatherAdditionalInfo(
                          title: 'Humidity',
                          value: state.weatherModel.humidity.toString(),
                          icon: Icons.water_drop_sharp,
                        ),
                        WeatherAdditionalInfo(
                          title: 'Wind Speed',
                          value: state.weatherModel.windSpeed.toString(),
                          icon: Icons.air,
                        ),
                        WeatherAdditionalInfo(
                          title: 'Pressure',
                          value: state.weatherModel.pressure.toString(),
                          icon: Icons.speed,
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
