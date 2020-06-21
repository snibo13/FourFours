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

List themes = [theme9];
List logosLoading = ["assets/images/logo1.gif"];

List logos = ["assets/images/logo1.png"];

//TI Datamouth 2500
ThemeData theme1 = new ThemeData(
    accentColor: Color(0xffCED4CC),
    //Buttons
    backgroundColor: Color(0xffCED4CC),
    //Background

    primaryColor: Color(0xffF6AC2D),
    //Logo and Accents
    primaryColorDark: Color(0xff8D9687),
    //Window color
    textTheme: TextTheme(
        bodyText1: TextStyle(color: Color(0xff565C5C)),
        headline3: TextStyle(color: Color(0xff565C5C)),
        headline4: TextStyle(color: Color(0xff565C5C))));

//TI 81
ThemeData theme2 = new ThemeData(
  accentColor: Color(0xff1F3037),
    backgroundColor: Color(0xff172432),
  primaryColor: Color(0xff226BC1),
  primaryColorDark: Color(0xff83CCDF),
  textTheme: TextTheme(
    bodyText1: TextStyle(color: Color(0xff35A2DF)),
    headline3: TextStyle(color: Colors.white),
    headline4: TextStyle(color: Color(0xff172432)),
  ),
);

//Snow Storm
ThemeData theme3 = new ThemeData(
  accentColor: Color(0xff3b3b37),
  //Buttons
  backgroundColor: Color(0xff2b2b2b),
  //Background
  primaryColor: Color(0xff004D0D),
  //Logo and =s
  primaryColorDark: Color(0xff004D0D),
  //Window
  textTheme: TextTheme(
    bodyText1: TextStyle(color: Color(0xff8a8a81)), //Text
    headline3: TextStyle(color: Color(0xff219e21)), //Scores
    headline4: TextStyle(color: Color(0xff219e21)), //Value
  ),
);

//Unmarked Ocean
ThemeData theme4 = new ThemeData(
  accentColor: Color(0xff144B59),
  //Buttons
  backgroundColor: Color(0xff3B6571),
  //Background
  primaryColor: Color(0xff144B59),
  //Logo and =s
  primaryColorDark: Color(0xffBDE8E5),
  //Window
  textTheme: TextTheme(
    bodyText1: TextStyle(color: Color(0xffBDE8E5)), //Text
    headline3: TextStyle(color: Color(0xffBDE8E5)), //Scores
    headline4: TextStyle(color: Color(0xff144B59)), //Value
  ),
);

ThemeData theme5 = new ThemeData(
  accentColor: Color(0xff9C1125),
  //Buttons
  backgroundColor: Color(0xff800000),
  //Background
  primaryColor: Color(0xff9C1125),
  //Logo and =s
  primaryColorDark: Color(0xff9C1125),
  //Window
  textTheme: TextTheme(
    bodyText1: TextStyle(color: Colors.white), //Text
    headline3: TextStyle(color: Colors.white), //Scores
    headline4: TextStyle(color: Color(0xffC0C0C0)), //Value
  ),
);

ThemeData theme6 = new ThemeData(
  accentColor: Color(0xffEAA021),
  //Buttons
  backgroundColor: Color(0xffF5C24A),
  //Background
  primaryColor: Color(0xff504E52),
  //Logo and =s
  primaryColorDark: Color(0xffEAA021),
  //Window
  textTheme: TextTheme(
    bodyText1: TextStyle(color: Colors.white), //Text
    headline3: TextStyle(color: Colors.white), //Scores
    headline4: TextStyle(color: Colors.white), //Value
  ),
);

ThemeData theme7 = new ThemeData(
  accentColor: Color(0xffD6E9F3),
  //Buttons
  backgroundColor: Color(0xff282C34),
  //Background
  primaryColor: Color(0xffE06C75),
  //Logo and =s
  primaryColorDark: Color(0xffD6E9F3),
  //Window
  textTheme: TextTheme(
    bodyText1: TextStyle(color: Color(0xff55606D)), //Text
    headline3: TextStyle(color: Color(0xff55606D)), //Scores
    headline4: TextStyle(color: Color(0xff282C34)), //Value
  ),
);

ThemeData theme8 = new ThemeData(
  accentColor: Color(0xff919BE5),
  //Buttons
  backgroundColor: Color(0xff232434),
  //Background
  primaryColor: Color(0xff6CB49F),
  //Logo and =s
  primaryColorDark: Color(0xff363E7E),
  //Window
  textTheme: TextTheme(
    bodyText1: TextStyle(color: Color(0xff363E7E)), //Text
    headline3: TextStyle(color: Color(0xff919BE5)), //Scores
    headline4: TextStyle(color: Color(0xff919BE5)), //Value
  ),
);

//BMO
ThemeData theme9 = new ThemeData(
  accentColor: Color(0xffCCFFDC),
  //Buttons
  backgroundColor: Color(0xff5CB19E),
  //Background
  primaryColor: Color(0xff6CB49F),
  //Logo and =s
  primaryColorDark: Color(0xffCCFFDC),
  //Window
  textTheme: TextTheme(
    bodyText1: TextStyle(color: Color(0xff001029)), //Text
    headline3: TextStyle(color: Color(0xff001029)), //Scores
    headline4: TextStyle(color: Color(0xff5EE177)), //Value
  ),
);
