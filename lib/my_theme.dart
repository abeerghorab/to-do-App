import 'package:flutter/material.dart';

class MyThemeData {
  static const Color primaryLightColor = Color(0xff5D9CEC);
  static const Color whiteColor = Color(0xffFFFFFF);
  static const Color greenColor = Color(0xff61E757);
  static const Color redColor = Color(0xffEC4848);
  static const Color blackColor = Color(0xff383838);
  static const Color greyColor = Colors.grey;
  static const Color backgroundlightColor = Color(0xffDFECDB);
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryLightColor,
    scaffoldBackgroundColor: backgroundlightColor,
    appBarTheme: AppBarTheme(backgroundColor: primaryLightColor, elevation: 0),
    primaryTextTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: whiteColor,
      ),
      headline2: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: primaryLightColor,
      ),
      subtitle1: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: blackColor,
      ),
      subtitle2: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: blackColor,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: primaryLightColor,
      unselectedItemColor: greyColor,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
  );
}
