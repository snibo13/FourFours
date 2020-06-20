import 'package:flutter/material.dart';


import 'About.dart';
import 'Game.dart';
import 'Menu.dart';
import 'Help.dart';
import 'Themes.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Four Fours',
      debugShowCheckedModeBanner: false,
      theme: themes[theme],
      home: Menu(),
      routes: {
        'Play': (BuildContext context) => GamePage(gameType: 1),
        'Arcade': (BuildContext context) => GamePage(gameType: 2),
        'Help': (BuildContext context) => Help(),
        'About': (BuildContext context) => About()
      },
    );
  }
}


