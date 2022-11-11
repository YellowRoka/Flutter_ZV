  import 'package:flutter/material.dart';

ThemeData mainTheme() {
    return ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 20, 20, 20),
        elevatedButtonTheme:       ElevatedButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: const Color.fromRGBO(171, 177, 197, 1),
            primary:         const Color.fromARGB(255, 255, 255, 255)
          ),
        ),
    );
  }
  