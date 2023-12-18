import 'package:flutter/material.dart';

ThemeData myTheme = ThemeData(
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: Colors.indigo),
    appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.indigo,
        titleTextStyle: TextStyle(
          color: Colors.white,
        )),
    iconTheme: const IconThemeData(color: Colors.white),
    textTheme: const TextTheme(
      bodySmall: TextStyle(
        fontSize: 12,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: Colors.white,
      ),
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
