import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightThemeData = ThemeData(
    useMaterial3: true,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(),
      bodySmall: TextStyle(color: Colors.grey,fontSize: 13),
      bodyLarge: TextStyle(fontSize: 22,fontWeight: FontWeight.w700,color: CupertinoColors.black),
      titleLarge: TextStyle(fontSize: 17,fontWeight: FontWeight.w700,color: Colors.black),
      titleSmall:  TextStyle(fontSize: 13,color: Color.fromRGBO(144, 144, 144, 1))
    ),
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
  );
}
