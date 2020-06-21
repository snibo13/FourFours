import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';


int theme;

Future<int> getTheme() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (!prefs.containsKey("theme")) {
    await prefs.setInt("theme", 0);
  }
  theme = prefs.getInt("theme");
  return theme;
}

List themes = [theme1];
List logosLoading = ["assets/images/logo1.gif"];

List logos = ["assets/images/logo1.png"];

ThemeData theme1 = new ThemeData(
    backgroundColor: Color(0xffCCD2C6),
    //Dark grey
    accentColor: Color(0xffCED4CC),
    //Light grey
    primaryColor: Color(0xffEE6E48),
    //Logo and Accents
    primaryColorDark: Color(0xff8D9687),
    //Window color
    textTheme:
        TextTheme(bodyText1: TextStyle(color: Color(0xff565C5C)) //Text Color
            ));
