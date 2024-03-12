//service class for weather api

import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../model/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  static const base_URL = 'http://api.openweathermap.org/data/2.5/weather';
  final String apiKey='a7678113340a26ac73009ea16370c214';

  WeatherService();

  Future<Weather> getWeather(String cityName) async {
    final response = await http
        .get(Uri.parse('$base_URL?q=$cityName&appid=$apiKey&units=metric'));
    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('failed to get data from api');
    }
  }
//get user location using geolocator from user's device
  Future<String> getCurrentCity() async {
    LocationPermission permission = await Geolocator.checkPermission();
    //get permission
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    //get user location
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    //to get city from position
    String? city = placemarks[0].locality;
    return city ?? '';
  }
}
