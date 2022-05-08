import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:switchplus_employee/styles/colors.dart';

ThemeData lightTheme = ThemeData(
    primaryColor: defaultColor,
    scaffoldBackgroundColor: Colors.grey[50],
    appBarTheme: AppBarTheme(
        titleSpacing: 20,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.grey[50],
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: Colors.grey[50],
        elevation: 0,
        titleTextStyle: const TextStyle(
          fontFamily: 'Helvetica',
          color: Colors.white,
          fontSize: 23,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(
          color: Colors.grey[50],
        )),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.grey[50],
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      // selectedItemColor: ,
      unselectedItemColor: Colors.grey,
      elevation: 20,
    ),
    textTheme: TextTheme(
        bodyText1: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: HexColor('#000000'),
          height: 1.4,
        ),
        subtitle1: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: HexColor('#000000'),
        )),
    fontFamily: 'Helvetica',
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: secondColor,
      ),
    ));
