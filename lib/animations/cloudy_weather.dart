import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CloudyWeather extends StatelessWidget {
  const CloudyWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Lottie.asset('assets/animations/clouds.json', width: 250, height: 250),
        Lottie.asset('assets/animations/ufocloud.json',
            height: 200, width: 200, repeat: false)
      ],
    );
  }
}
