import 'package:flutter/material.dart';

class WeatherDetailsCard extends StatelessWidget {
  final String description;
  final double temperature;

  const WeatherDetailsCard({
    required this.description,
    required this.temperature,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final weatherIcon = description.contains('cloudy')
        ? Icons.cloud
        : description.contains('rain')
        ? Icons.water_drop_sharp
        : description.contains('snow')
        ? Icons.snowing
        : Icons.sunny;

    return SizedBox(
      width: .infinity,
      child: Card(
        child: Padding(
          padding: .all(25),
          child: Column(
            children: [
              ///temp
              Text('$temperature K', style: TextStyle(fontSize: 28),),
              const SizedBox(height: 10,),
          
              ///icon
              Icon(weatherIcon,size: 50,),
              const SizedBox(height: 10,),
          
              ///description
              Text(description.toUpperCase(), style: TextStyle(fontSize: 25),),
            ],
          ),
        ),
      ),
    );
  }
}
