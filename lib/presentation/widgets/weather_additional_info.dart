import 'package:flutter/material.dart';

class WeatherAdditionalInfo extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const WeatherAdditionalInfo({
    required this.title,
    required this.value,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///icon
        Icon(icon, size: 25),
        const SizedBox(height: 2),

        ///title
        Text(title, style: TextStyle(fontSize: 18)),
        const SizedBox(height: 2),

        ///value
        Text(value, style: TextStyle(fontSize: 20)),
      ],
    );
  }
}
