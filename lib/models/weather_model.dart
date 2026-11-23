class WeatherModel {
  final String desc;
  final double temperature;
  final double feelsLike;
  final double humidity;
  final double windSpeed;
  final double pressure;

  const WeatherModel({
    required this.desc,
    required this.temperature,
    required this.feelsLike,
    required this.humidity,
    required this.windSpeed,
    required this.pressure,
  });

  @override
  String toString() {
    return 'WeatherModel{'
        ' desc: $desc,'
        ' temperature: $temperature,'
        ' feelsLike: $feelsLike,'
        ' humidity: $humidity,'
        ' windSpeed: $windSpeed,'
        ' pressure: $pressure,'
        '}';
  }

  WeatherModel copyWith({
    String? desc,
    double? temperature,
    double? feelsLike,
    double? humidity,
    double? windSpeed,
    double? pressure,
  }) {
    return WeatherModel(
      desc: desc ?? this.desc,
      temperature: temperature ?? this.temperature,
      feelsLike: feelsLike ?? this.feelsLike,
      humidity: humidity ?? this.humidity,
      windSpeed: windSpeed ?? this.windSpeed,
      pressure: pressure ?? this.pressure,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'desc': desc,
      'temperature': temperature,
      'feelsLike': feelsLike,
      'humidity': humidity,
      'windSpeed': windSpeed,
      'pressure': pressure,
    };
  }

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      desc: json['weather'][0]['description'] ,
      temperature: json['main']['temp'] as double,
      feelsLike: json['main']['feels_like'] as double,
      humidity: json['main']['humidity'] as double,
      windSpeed: json['wind']['speed'] as double,
      pressure: json['main']['pressure'] as double,
    );
  }
}
