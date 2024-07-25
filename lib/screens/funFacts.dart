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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    title: 'Uranus'),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                const PlanetContainer(
                    description:
                        'Neptune, the eighth planet from the Sun, is an ice giant known for its deep blue color and supersonic winds. It’s the most distant planet in our solar system, with a dynamic\nRead more...',
                    imagePath: 'assets/neptune.jpg',
                    title: 'Neptune'),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                const PlanetContainer(
                    description:
                        'Pluto, once the ninth planet, is now classified as a dwarf planet. Discovered in 1930, it resides in the Kuiper Belt. Pluto has a thin atmosphere and five moons, with Charon being the largest.\nRead More...',
                    imagePath: 'assets/pluto.jpg',
                    title: 'Pluto'),
                SizedBox(
                  height: screenHeight * 0.04,
                ),
                Text(
                  'Other Celestial Bodies',
                  style: TextStyle(
                      color: AppColors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                const PlanetContainer(
                    description:
                        'Europa, one of Jupiter’s moons, is believed to have a subsurface ocean beneath its icy crust. This ocean could harbor the necessary conditions for life, making Europa a key target for future space\nRead more...',
                    imagePath: 'assets/europa.jpeg',
                    title: 'Europa'),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                const PlanetContainer(
                    description:
                        'Saturn’s moon Enceladus is known for its icy plumes that eject material from a subsurface ocean. These plumes contain organic molecules and other compounds, raising the\nRead More...',
                    imagePath: 'assets/encelaudus.webp',
                    title: 'Enceladus'),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                const PlanetContainer(
                    description:
                        'Titan, Saturn\'s largest moon, features a thick atmosphere and liquid methane lakes on its surface. These conditions might offer an alternative to Earth-like life, with methane-based.\nRead More...',
                    imagePath: 'assets/titan.jpeg',
                    title: 'Titan'),
                    SizedBox(
                  height: screenHeight * 0.02,
                ),
                const PlanetContainer(
                    description:
                        'Titan, Saturn\'s largest moon, features a thick atmosphere and liquid methane lakes on its surface. These conditions might offer an alternative to Earth-like life, with methane-based.\nRead More...',
                    imagePath: 'assets/ganymede.jpg',
                    title: 'Ganymede'),
                    SizedBox(
                  height: screenHeight * 0.04,
                ),
                Text(
                  'Exo-Planets',
                  style: TextStyle(
                      color: AppColors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),

                const PlanetContainer(
                    description:
                        'Titan, Saturn\'s largest moon, features a thick atmosphere and liquid methane lakes on its surface. These conditions might offer an alternative to Earth-like life, with methane-based.\nRead More...',
                    imagePath: 'assets/kepler186.jpg',
                    title: 'Kepler-186f'),
                    SizedBox(
                  height: screenHeight * 0.02,
                ),
                const PlanetContainer(
                    description:
                        'Titan, Saturn\'s largest moon, features a thick atmosphere and liquid methane lakes on its surface. These conditions might offer an alternative to Earth-like life, with methane-based.\nRead More...',
                    imagePath: 'assets/proxima.webp',
                    title: 'Proxima Centauri b'),
                    SizedBox(
                  height: screenHeight * 0.02,
                ),
                const PlanetContainer(
                    description:
                        'Titan, Saturn\'s largest moon, features a thick atmosphere and liquid methane lakes on its surface. These conditions might offer an alternative to Earth-like life, with methane-based.\nRead More...',
                    imagePath: 'assets/trappist.png',
                    title: 'TRAPPIST-1d'),
                    SizedBox(
                  height: screenHeight * 0.02,
                ),
                const PlanetContainer(
                    description:
                        'Titan, Saturn\'s largest moon, features a thick atmosphere and liquid methane lakes on its surface. These conditions might offer an alternative to Earth-like life, with methane-based.\nRead More...',
                    imagePath: 'assets/kepler452.jpg',
                    title: 'Kepler-452b'),
                    SizedBox(
                  height: screenHeight * 0.02,
                ),
                const PlanetContainer(
                    description:
                        'Titan, Saturn\'s largest moon, features a thick atmosphere and liquid methane lakes on its surface. These conditions might offer an alternative to Earth-like life, with methane-based.\nRead More...',
                    imagePath: 'assets/lhs.webp',
                    title: 'LHS 1140 b')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
