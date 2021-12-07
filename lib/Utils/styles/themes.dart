import 'package:flutter/material.dart';

import 'colors.dart';
 

ThemeData lightTheme = ThemeData(
  //primaryColor: primaryColor,
  //primarySwatch: Colors.red,
  primaryColor: primaryColor,

  accentColor: primaryColor,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: primaryColor,
    unselectedItemColor: Colors.grey,
  ),

  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(
      color: Colors.grey[800], //change your color here
    ),
   
  ),

  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: primaryColor,
  ),
  // primarySwatch: Colors.red,
  scaffoldBackgroundColor: Colors.white,
);

///
ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.black26,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    foregroundColor: Colors.green,
  ),
  appBarTheme: AppBarTheme(
     
  ),
);
