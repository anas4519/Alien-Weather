import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/screens/searched_weather.dart';
import 'package:weather_app/utils/colors.dart';

class SavedCities extends StatefulWidget {
  const SavedCities({super.key});

  @override
  State<SavedCities> createState() => _SavedCitiesState();
}

class _SavedCitiesState extends State<SavedCities> {
  List<String> favoriteCities = [];

  @override
  void initState() {
    super.initState();
    loadFavoriteCities();
  }

  Future<void> loadFavoriteCities() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? cities = prefs.getStringList('favoriteCities');
    if (cities != null) {
      setState(() {
        favoriteCities = cities;
      });
    }
  }

  Future<void> removeCity(String cityName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? cities = prefs.getStringList('favoriteCities');
    if (cities != null) {
      cities.remove(cityName);
      await prefs.setStringList('favoriteCities', cities);
      setState(() {
        favoriteCities = cities;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Saved Locations',
          style: TextStyle(fontSize: 18),
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.01),
          child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColors.primary,
                size: 18,
              )),
        ),
      ),
      body: favoriteCities.isEmpty
          ? Center(
              child: Text(
                'No saved locations',
                style: TextStyle(color: AppColors.grey, fontSize: 18),
              ),
            )
          : Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: ListView.builder(
                itemCount: favoriteCities.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Dismissible(
                        key: Key(favoriteCities[index]),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          removeCity(favoriteCities[index]);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                '${favoriteCities[index]} removed from favourites',
                                style: TextStyle(color: AppColors.grey),
                              ),
                              backgroundColor: const Color(0xFFC1272D),
                            ),
                          );
                        },
                        background: Container(
                          color: const Color(0xFFC1272D),
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: const Icon(
                            Icons.remove_circle,
                            color: Colors.white,
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => SearchedWeatherScreen(
                                    cityName: favoriteCities[index])));
                          },
                          child: Container(
                            width: screenWidth,
                            height: screenHeight * 0.1,
                            padding: EdgeInsets.all(screenWidth * 0.04),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(screenWidth * 0.02),
                                color: AppColors.containerGrey),
                            child: Row(
                              children: [
                                Text(
                                  favoriteCities[index],
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: AppColors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Spacer(),
                                IconButton(
                                    onPressed: () {
                                      removeCity(favoriteCities[index]);
                                    },
                                    icon: const Icon(
                                      Icons.remove_circle,
                                      color: Color(0xFFC1272D),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      )
                    ],
                  );
                },
              ),
            ),
    );
  }
}
