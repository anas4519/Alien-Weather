import 'package:flutter/material.dart';
import 'package:weather_app/planets/mercury_info.dart';
import 'package:weather_app/utils/colors.dart';

class PlanetContainer extends StatelessWidget {
  const PlanetContainer({super.key, required this.description, required this.imagePath, required this.title});
  final String title;
  final String imagePath;
  final String description;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => MercuryInfo()));
      },
      child: Container(
        width: screenWidth * 0.9,
        padding: EdgeInsets.all(screenWidth * 0.04),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(screenWidth * 0.04),
            color: AppColors.containerGrey),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: AppColors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            Row(
              children: [
                Container(
                  height: screenHeight * 0.125,
                  width: screenWidth * 0.3,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primary),
                  ),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.04,
                ),
                Expanded(
                  child: Text(
                    description,
                    style: TextStyle(color: AppColors.grey, fontSize: 12),
                    softWrap: true,
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.start,
                    
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
