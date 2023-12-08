import 'package:flutter/material.dart';

ThemeData myTheme = ThemeData(
    appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.indigo,
        titleTextStyle: const TextStyle(
          color: Colors.white,
        )),
    iconTheme: IconThemeData(color: Colors.white),
    textTheme: TextTheme(
      bodyMedium: TextStyle(fontSize: 12, color: Colors.white),
      bodyLarge: TextStyle(fontSize: 15, color: Colors.white),
      titleLarge: TextStyle(
        fontSize: 22,
      ),
      titleMedium: TextStyle(fontSize: 18, color: Colors.white),
//TODO: TRY TO ADD FONT TO TEXTTHEME
    ),
    primaryColorDark: Colors.grey[900],
    drawerTheme: DrawerThemeData(
      backgroundColor: Colors.grey[900],
    ));
