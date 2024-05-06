import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/utilities/constants.dart';

class Weather {
  double? longitude, latitude;

  Future<dynamic> getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        "$openWeatherMapUrl?units=metric&lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey");
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper =
        NetworkHelper("$openWeatherMapUrl?units=metric&q=$cityName&appid=$apiKey");
    var weatherData = await networkHelper.getData();
    return weatherData;
  }
}
