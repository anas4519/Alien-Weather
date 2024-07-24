import 'package:flutter/material.dart';
import 'package:weather_app/utils/colors.dart';

class InfoColumn extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String text;
  final String title;
  const InfoColumn({super.key, required this.icon, required this.iconColor, required this.text, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon, color: iconColor,
        ),
        Text(text, style: TextStyle(color: AppColors.grey, fontWeight: FontWeight.bold),),
        Text(title, style: TextStyle(color: AppColors.grey, fontSize: 12))
      ],
    );
  }
}
