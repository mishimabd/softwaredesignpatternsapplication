class Weather {
  late String cityName;
  late num temp;
  late num wind;
  late num feels;

  Weather(
      {required this.cityName,
      required this.feels,
      required this.temp,
      required this.wind});

  Weather.fromJson(Map<String, dynamic> json) {
    cityName = json["name"];
    temp = json["main"]["temp"];
    wind = json["wind"]["speed"];
    feels = json["main"]["feels_like"];
  }
}
