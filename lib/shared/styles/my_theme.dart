import 'package:flutter/material.dart';

class MyThemeData {
  static Color primaryColor = Color(0xFF5D9CEC);
  static Color OnprimaryColor = Color(0xFFDFECDB);
  static Color RedColor = Color(0xFFEC4B4B);
  static Color GreenColor = Color(0xFF61E757);
  static Color WhiteColor = Color(0xFFFFFFFF);
  static Color BlackColor = Color(0xF9000000);
  static Color DarkOnprimaryColor = Color(0xFF081231);
  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: OnprimaryColor,
    appBarTheme: AppBarTheme(
        //centerTitle: true,
        color: primaryColor,
        elevation: 0,
        iconTheme: IconThemeData(color: WhiteColor)),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 25,
        color: WhiteColor,
        fontWeight: FontWeight.w700,// text AppBar
      ),
      headline2: TextStyle(
        fontSize: 25,
        color:BlackColor ,
        fontWeight: FontWeight.bold,//text Add New Task
      ),
      headline3: TextStyle(
        fontSize: 25,
        color: Colors.grey,//text of badg of Add New Task__feild text
        fontWeight: FontWeight.w400,
      ),
      subtitle1: TextStyle(
        fontSize: 25,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      bodyText1: TextStyle(
        fontSize: 15,
        color: Colors.black,
        fontWeight: FontWeight.w500,// task titel
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: primaryColor, unselectedItemColor: Colors.grey),
  );
  static final ThemeData DarkTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: DarkOnprimaryColor,
    appBarTheme: AppBarTheme(
      //centerTitle: true,
        color: primaryColor,
        elevation: 0,
        iconTheme: IconThemeData(color: BlackColor)),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 25,
        color: BlackColor,
        fontWeight: FontWeight.w700,// text AppBar
      ),
      headline2: TextStyle(
        fontSize: 25,
        color:WhiteColor ,
        fontWeight: FontWeight.bold,//text Add New Task
      ),
      headline3: TextStyle(
        fontSize: 25,
        color: Colors.grey,//text of badg of Add New Task__feild text
        fontWeight: FontWeight.w400,
      ),
      subtitle1: TextStyle(
        fontSize: 25,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      bodyText1: TextStyle(
        fontSize: 15,
        color: WhiteColor,
        fontWeight: FontWeight.w500,// task titel
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: primaryColor, unselectedItemColor: Colors.grey),
  );
}
