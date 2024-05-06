class WeatherModel {
  String? location, icon, description;
  dynamic temperature, feelsLike, humidity, wind;

  WeatherModel(
      {this.description,
      this.temperature,
      this.location,
      this.icon,
      this.feelsLike,
      this.humidity,
      this.wind});
}
