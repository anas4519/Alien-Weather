import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SunnyWeather extends StatefulWidget {
  const SunnyWeather({super.key});

  @override
  State<SunnyWeather> createState() => _SunnyWeatherState();
}

class _SunnyWeatherState extends State<SunnyWeather> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Lottie.asset('assets/animations/sun.json', height: 175)],
          ),
          Positioned(
              top: 50,
              child:
                  Lottie.asset('assets/animations/happyAlien.json', height: 300))
        ],
      ),
    );
  }
}
