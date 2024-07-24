import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/screens/funFacts.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:weather_app/screens/search_screen.dart';
import 'package:weather_app/utils/colors.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  final PageController _pageController = PageController();

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    SearchScreen(),
    Funfacts()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index); // Jump to the selected page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: _widgetOptions,
      ),
      bottomNavigationBar: Container(
        height: 65,
        child: BottomNavigationBar(
          
          backgroundColor: AppColors.appBarGrey,
          selectedItemColor: AppColors.primary,
          selectedLabelStyle: TextStyle(
              fontFamily: GoogleFonts.orbitron().fontFamily,
              color: AppColors.primary,
              fontSize: 8),
          unselectedLabelStyle: TextStyle(
            fontFamily: GoogleFonts.orbitron().fontFamily,
            fontSize: 8
          ),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled, size: 22,),
              label: 'Home',
              
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, size: 22,),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Text(
                '👽',
                style: TextStyle(fontSize: 16),
              ),
              label: 'More',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          unselectedItemColor: Colors.grey[300],
          
        ),
      ),
    );
  }
}
