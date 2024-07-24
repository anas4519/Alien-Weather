import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/animations/cloudy_weather.dart';
import 'package:weather_app/animations/sunny_weather.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/utils/colors.dart';
import 'package:weather_app/widgets/info_column.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherData? weatherInfo;
  String? city;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchWeatherAndCity();
  }

  Future<void> fetchWeatherAndCity() async {
    try {
      String currentCity = await WeatherService().getCurrCity();
      WeatherData? weatherData =
          await WeatherService().fetchWeather(currentCity);

      setState(() {
        city = currentCity;
        weatherInfo = weatherData;
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      // Handle error by showing an error message or logging it
      print('Error fetching weather or city: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    final WeatherData? weather = weatherInfo;

    var screenHeight = MediaQuery.of(context).size.width;
    var screenWidth = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Alien Weather', style: TextStyle(fontSize: 18),),
        centerTitle: true,
      ),
      body: isLoading
          ? Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('assets/animations/loading.json', height: 50),
                Text('Loading...')
              ],
            ))
          : weather == null
              ? Center(
                  child: Text(
                    'Failed to load weather data',
                    style: TextStyle(color: AppColors.grey, fontSize: 18),
                  ),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(screenWidth * 0.02),
                    child: Center(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(screenWidth * 0.015),
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 48, 48, 48),
                                  borderRadius: BorderRadius.circular(
                                      screenWidth * 0.02)),
                              child: Column(
                                children: [
                                  Text(
                                    weather.name,
                                    style: TextStyle(
                                        fontSize: 24, color: AppColors.grey),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "${weather.temperature.current.toStringAsFixed(2)}°C",
                                    style: TextStyle(
                                        color: AppColors.grey,
                                        fontSize: 55,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    weather.weather[0].main,
                                    style: TextStyle(
                                        fontSize: 20, color: AppColors.grey),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        if (weather.weather[0].main == 'Clouds' ||
                            weather.weather[0].main == 'Haze' ||
                            weather.weather[0].main == 'Mist')
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "It's cloudy outside, hard to look for UFO's",
                                    style: TextStyle(
                                        color: AppColors.grey, fontSize: 18),
                                  ),
                                ],
                              ),
                              const SizedBox(child: CloudyWeather()),
                            ],
                          ),
                        if (weather.weather[0].main == 'Clear' ||
                            weather.weather[0].main == 'Sunny')
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "It's clear outside, look for UFO's",
                                        style: TextStyle(
                                            color: AppColors.grey, fontSize: 18),
                                      ),
                                      Lottie.asset('assets/animations/ufo.json', height: 60)
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(child: SunnyWeather()),
                            ],
                          ),
                        if (weather.weather[0].main == 'Rain')
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "It's raining outside, hard to look for UFO's",
                                    style: TextStyle(
                                        color: AppColors.grey, fontSize: 18),
                                  ),
                                ],
                              ),
                              const SizedBox(child: SunnyWeather()),
                            ],
                          ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        Container(
                          width: screenWidth * 0.9,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 48, 48, 48),
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.02)),
                          child: Padding(
                            padding: EdgeInsets.all(screenWidth * 0.03),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InfoColumn(
                                        icon: Icons.wind_power,
                                        iconColor: AppColors.grey,
                                        text: '${weather.wind.speed}km/h',
                                        title: 'Wind'),
                                    InfoColumn(
                                        icon: Icons.sunny,
                                        iconColor: AppColors.grey,
                                        text:
                                            '${weather.maxTemperature.toStringAsFixed(2)}°C',
                                        title: 'Max'),
                                    InfoColumn(
                                        icon: Icons.wind_power,
                                        iconColor: AppColors.grey,
                                        text:
                                            '${weather.minTemperature.toStringAsFixed(2)}°C',
                                        title: 'Min'),
                                  ],
                                ),
                                SizedBox(
                                  height: screenHeight * 0.04,
                                ),
                                Divider(
                                  color: AppColors.grey,
                                ),
                                SizedBox(
                                  height: screenHeight * 0.04,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InfoColumn(
                                        icon: Icons.water_drop,
                                        iconColor: Colors.amber,
                                        text: '${weather.humidity}%',
                                        title: 'Humidity'),
                                    InfoColumn(
                                        icon: Icons.water,
                                        iconColor: Colors.amber,
                                        text: '${weather.pressure}hPa',
                                        title: 'Pressure'),
                                    InfoColumn(
                                        icon: Icons.bar_chart,
                                        iconColor: Colors.amber,
                                        text: '${weather.seaLevel}m',
                                        title: 'Sea-Level'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
                  ),
                ),
    );
  }
}
