import 'package:flutter/material.dart';

class MyTheme {


  static Color primaryColor =  Color(0xff141a2e);
  static Color primaryLight = Color(0xffB7935F);
  static Color blackColor = Color(0xff242424);
  static Color whiteColor = Colors.white;
  static Color yellow = Color(0xffFACC1D);
  static ThemeData LightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: primaryLight,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: blackColor,
      ),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w700,
        color: blackColor,
        fontFamily: 'El Messiri',
      ),
      titleMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w600,
        color: blackColor,
        fontFamily: 'El Messiri',
      ),
      titleSmall: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: blackColor,
        fontFamily: 'El Messiri',
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: blackColor,
      unselectedItemColor: whiteColor,
    ),
    dividerColor: Color(0xffB7935F)

  );

  static ThemeData darkTheme = ThemeData(

    primaryColor:  Color(0xff141a2e),
    colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffFACC1D),

    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: blackColor, // Change icon color to white
      ),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w700,
        color: whiteColor, // Change text color to white
        fontFamily: 'El Messiri',
      ),
      titleMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w600,
        color: Color(0xffFACC1D),
        fontFamily: 'El Messiri',
      ),
      titleSmall: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: whiteColor, // Change text color to white
        fontFamily: 'El Messiri',
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xff141a2e),
      selectedItemColor: Color(0xffFACC1D),

    ),

    dividerColor: yellow,
      iconTheme: IconThemeData(
        color: whiteColor,
      ),
  );

}
