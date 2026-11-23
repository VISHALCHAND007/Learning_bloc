import 'package:http/http.dart' as http;
import 'package:learning_bloc/static/private_key.dart';

class WeatherData {
  Future<String> getWeatherData({required String city}) async {
    final res = await http.get(
      Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=${PrivateKey.openWeatherKey}',
      ),
    );
    if(res.statusCode == 200) {
      return res.body;
    }
    throw Exception('Error while getting the data: ${res.statusCode}');
  }
}
