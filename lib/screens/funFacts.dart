import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weather_app/planets/mercury_info.dart';
import 'package:weather_app/utils/colors.dart';
import 'package:weather_app/widgets/planet_container.dart';

class Funfacts extends StatelessWidget {
  const Funfacts({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Weather on other Planets',
          style: TextStyle(color: AppColors.primary, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.02),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.04,
                ),
                const PlanetContainer(
                  imagePath: 'assets/mercury.webp',
                  description:
                      'Mercury, the smallest and\ninnermost planet in our solar \nsystem, orbits the Sun in just 88\nEarth days.\nDespite its proximity, it\'s not\nthe hottest planet.\nRead more...',
                  title: 'Mercury',
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                const PlanetContainer(
                  imagePath: 'assets/venus.webp',
                  description:
                      'Venus, the second planet from the Sun, is often called Earth’s “sister planet” due to its similar size and composition.\nHowever, its thick, toxic atmosphere and extreme surface\nRead mode....',
                  title: 'Venus',
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                const PlanetContainer(
                    description:
                        'Mars, the fourth planet from the Sun, is known as the Red Planet due to its iron oxide-rich surface. It has a thin atmosphere, polar ice caps, and the largest volcano in the solar system, Olympus\nRead more... ',
                    imagePath: 'assets/mars.webp',
                    title: 'Mars'),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                const PlanetContainer(
                    description:
                        'Jupiter, the fifth planet from the Sun, is the largest in our solar system. This gas giant is more than twice as massive as all other planets combined. Known for its Great Red Spot, a giant storm,\nRead more...',
                    imagePath: 'assets/jupiter.webp',
                    title: 'Jupiter'),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                const PlanetContainer(
                    description:
                        'Saturn, the sixth planet from the Sun, is renowned for its stunning ring system composed of ice and rock particles. This gas giant, primarily made of hydrogen and helium, has over 80 moons,\nRead more...',
                    imagePath: 'assets/saturn.jpg',
                    title: 'Saturn'),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                const PlanetContainer(
                    description:
                        'Uranus, the seventh planet from the Sun, is an ice giant with a unique sideways rotation. Its blue-green color comes from methane in its atmosphere. Known for its faint rings and\nRead more...',
                    imagePath: 'assets/uranus.webp',
                    title: 'Uranus')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
