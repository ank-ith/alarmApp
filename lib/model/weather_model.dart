//created a weather model based on API

class Weather {
  final String cityName;
  final String country;
  final String longitude;
  final String latitude;
  final double temp;
  final String condition;

  Weather(
      {required this.longitude,
      required this.latitude,
      required this.cityName,
      required this.temp,
      required this.condition,required this.country});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        cityName: json['name'],
        temp: json['main']['temp'].toDouble(),
        condition: json['weather'][0]['main'],
        longitude: json['coord']['lon'].toString(),
        latitude: json['coord']['lat'].toString(),
        country: json['name']);
  }
}
