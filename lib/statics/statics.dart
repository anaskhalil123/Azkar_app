import 'package:flutter/material.dart';
import 'package:second_copy_for_azkar_application/model/theker_number.dart';

class Constants {
  static const main_color = Color(0xff9dbf2e);
  static const gray = const Color.fromARGB(255, 211, 211, 211);

  // static List<ThekerNumber> thekerNumbers = [];

  static ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: Constants.main_color,
    scaffoldBackgroundColor: Colors.white,
    cardColor: const Color.fromARGB(255, 211, 211, 211),
    textTheme: const TextTheme(
      titleSmall: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black),
    ),
  );
  
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor:  Constants.main_color,
    scaffoldBackgroundColor: const Color.fromARGB(255, 52, 52, 52),
    cardColor: const Color.fromARGB(255, 133, 133, 133),
    textTheme: const TextTheme(
      titleSmall: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
    ),
  );
}
