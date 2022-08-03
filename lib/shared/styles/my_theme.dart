import 'package:flutter/material.dart';

class MyThemeData {
  static Color primaryColor = Color(0xFF5D9CEC);
  static Color OnprimaryColor = Color(0xFFDFECDB);
  static Color RedColor = Color(0xFFEC4B4B);
  static Color GreenColor = Color(0xFF61E757);
  static Color WhiteColor = Color(0xFFFFFFFF);

  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: OnprimaryColor,
    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: primaryColor,
        elevation: 0,
        iconTheme: IconThemeData(color: WhiteColor)),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 30,
        color: WhiteColor,
        fontWeight: FontWeight.w700,
      ),
      headline2: TextStyle(
        fontSize: 25,
        color: primaryColor,
        fontWeight: FontWeight.w400,
      ),
      headline3: TextStyle(
        fontSize: 25,
        color: WhiteColor,
        fontWeight: FontWeight.w400,
      ),
      subtitle1: TextStyle(
        fontSize: 25,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      bodyText1: TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: primaryColor, unselectedItemColor: Colors.grey),
  );
}
