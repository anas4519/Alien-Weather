import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:weather_app/utils/colors.dart';

class NewNavBar extends StatefulWidget {
  const NewNavBar({super.key});

  @override
  State<NewNavBar> createState() => _NewNavBarState();
}

class _NewNavBarState extends State<NewNavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: AppColors.appBarGrey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: GNav(
            backgroundColor: AppColors.appBarGrey,
            activeColor: AppColors.grey,
            tabBackgroundColor: AppColors.primary,
            tabBorderRadius: 50,
            tabs: [
            GButton(icon: Icons.home, text: 'Home',),
            GButton(icon: Icons.search, text: 'Seacrh',),
            GButton(icon: Icons.more_horiz, text: 'More',)
            
          ]),
        ),
      ),
    );
  }
}