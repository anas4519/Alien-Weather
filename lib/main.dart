import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/nav_bar.dart';
import 'package:weather_app/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const alienGreen = Color.fromARGB(255, 88, 165, 0);
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF181818),
        textTheme: ThemeData.dark()
            .textTheme
            .apply(fontFamily: GoogleFonts.openSans().fontFamily),
        appBarTheme: AppBarTheme(
            centerTitle: true,
            backgroundColor: AppColors.appBarGrey,
            titleTextStyle: TextStyle(
                color: alienGreen,
                fontSize: 28,
                fontFamily: GoogleFonts.orbitron().fontFamily,
                fontWeight: FontWeight.bold)),
      ),
      debugShowCheckedModeBanner: false,
      home: const NavBar(),
    );
  }
}
