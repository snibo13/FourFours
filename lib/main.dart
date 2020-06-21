import 'package:flutter/material.dart';

import 'About.dart';
import 'Game.dart';
import 'Menu.dart';
import 'Help.dart';
import 'Themes.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: getTheme(),
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        if (snapshot.hasData) {
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
        } else {
          return Container();
        }
      },
    );
  }
}
