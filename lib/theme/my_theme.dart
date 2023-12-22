import 'package:flutter/material.dart';

ThemeData myTheme = ThemeData(
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: Colors.indigo),
    appBarTheme: const AppBarTheme(
        shadowColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.indigo,
        titleTextStyle: TextStyle(
          color: Colors.white,
        )),
    iconTheme: const IconThemeData(color: Colors.white),
    textTheme: const TextTheme(
      bodySmall: TextStyle(
        fontSize: 11,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 13,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
          fontSize: 15, color: Colors.white, overflow: TextOverflow.ellipsis),
      titleLarge: TextStyle(
        fontSize: 22,
        color: Colors.white,
        fontWeight: FontWeight.bold,
        overflow: TextOverflow.ellipsis,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    primaryColorDark: Colors.grey[900],
    drawerTheme: const DrawerThemeData(
      backgroundColor: Colors.indigo,
    ));
