import 'package:flutter/material.dart';

int theme = 0;

List themes = [theme1];


ThemeData theme1 = new ThemeData(
  backgroundColor: Color(0xffCCD2C6), //Dark grey
  accentColor: Color(0xffCED4CC),    //Light grey
  primaryColor: Color(0xffEE6E48),  //Logo and Accents
  primaryColorDark: Color(0xff8D9687), //Window color
  textTheme: TextTheme(
    bodyText1: TextStyle(color: Color(0xff565C5C)) //Text Color
  )

);