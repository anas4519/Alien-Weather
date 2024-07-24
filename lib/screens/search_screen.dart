import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_app/models/city.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/screens/searched_weather.dart';
import 'package:weather_app/utils/colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<City> _cities = [
    City(name: 'New Delhi'),
    City(name: 'Mumbai'),
    City(name: 'Kolkata'),
    City(name: 'Bengaluru'),
    City(name: 'Chennai'),
    City(name: 'Gurgaon'),
    City(name: 'Noida'),
    City(name: 'Dubai'),
    City(name: 'San Francisco'),
    City(name: 'London'),
    City(name: 'Tokyo'),
    City(name: 'Amsterdam'),
    City(name: 'Paris'),
    City(name: 'New York')
  ];

  List<City> _searchResults = [];
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData({String? searchText}) async {
    if (searchText == null || searchText.isEmpty) {
      setState(() {
        _isSearching = false;
      });
      return;
    }
    final url = 'https://api.api-ninjas.com/v1/city?name=$searchText';
    final response = await http.get(Uri.parse(url), headers: {'X-Api-Key': '6jmntJVJA0nWyIF0TXK7PQ==Ac9ikP1X67IMmCtd'});

    if (response.statusCode == 200) {
      final List<dynamic> citiesData = json.decode(response.body);
      setState(() {
        _searchResults = citiesData.map((cityData) => City(name: cityData['name'])).toList();
        _isSearching = true;
      });
    } else {
      print('Error: ${response.statusCode} ${response.body}');
      setState(() {
        _isSearching = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.07,
              ),
              Container(
                width: screenWidth * 0.9,
                height: screenHeight * 0.065,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  border: Border.all(color: AppColors.primary),
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 12,
                    ),
                    Icon(
                      Icons.search_rounded,
                      color: AppColors.primary,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: TextField(
                        onSubmitted: (value) {
                          _loadData(searchText: value);
                        },
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search a city...',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              _cityListView()
            ],
          ),
        ),
      ),
    );
  }

  Widget _cityListView() {
    final listToShow = _isSearching ? _searchResults : _cities;
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7, // Adjust the height as needed
      child: ListView.builder(
        itemCount: listToShow.length,
        itemBuilder: (ctx, index) {
          final cityName = listToShow[index].name;
          return ListTile(
            title: Text(cityName),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> SearchedWeatherScreen(cityName: cityName)));
            },
          );
        },
      ),
    );
  }
}
