import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather.dart';

class WeatherService {
  fetchWeather(String cityName) async {
    final response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=880b3bdc88ed9db164a960f4e4598194"));
      
      try{
        if(response.statusCode == 200){
          var json = jsonDecode(response.body);
          return WeatherData.fromJson(json);
        } else{
          throw Exception('Failed to load weather data');
        }
      } catch(e){
        print(e.toString());
      }
  }

  Future<String> getCurrCity() async{
    LocationPermission permission = await Geolocator.requestPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.checkPermission();
    }
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high
    );
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    String? city = placemarks[0].locality;
    return city ?? "";
  }
}
