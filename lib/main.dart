<<<<<<< HEAD
import 'dart:async';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'MathEngine.dart';
import 'package:flutter/services.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
          title: 'Four Fours',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
          home: MyHomePage(title: 'Four Fours'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 4;
  String _value = "";
  int _goal = 0;
  int _score;
  int _computation;
  Widget _body;
  bool _hide = false;
  String _alert = "";
  Color orange =  Color(0xffEE6E48);
  Color darkGrey = Color(0xff565C5C);
  Color lightGrey = Color(0xffCCD2C6);
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _body = loadingPage();
  }

  void _plus() {
    setState(() {
      _value+= "+";
    });
  }

  void correctSound() {
    Flame.audio.play("correct.mp3");
  }

  void squared() {
    setState(() {
      _value += '\u00B2';
    });
  }

  void _factorial() {
    setState(() {
      _value += '!';
    });
  }

  void _exp() {
    setState(() {
      _value+= "^";
    });
  }

  void _squared() {
    setState(() {
      _value += "²";
    });
  }

  void _minus() {
    setState(() {
      _value+="-";
    });
  }

  void _div() {
    setState(() {
      _value+="\u00F7";
    });
  }

  void _mult() {
    setState(() {
      _value+="x";
    });
  }

  void _sqrt() {
    setState(() {
      _value += '\u221a';
    });
  }

  void _openParen() {
    setState(() {
      _value+="(";
    });
  }

  void _closeParen() {
    setState(() {
      _value+=")";
    });
  }

  void _decimal() {
    setState(() {
      _value += ".";
    });
  }

  void _clear() {
    setState(() {
      _value = "";
      _counter = 4;
    });
  }

  void _equals() {
    setState(() {
      _computation = mathEngine(_value).round();
      if (_computation == _goal && _counter == 0) {
        _goal++;
        correctSound();
        _updateScore(_goal);
        _clear();
      } else {
        if(_counter != 0) {
          _alert="You must use 4 fours";
          _value += "=$_computation";
        } else {
          _alert = "Try Again!";
          _value += "=$_computation";
        }
      }
    });
  }

  void _four() {
    setState(() {
      if (_counter == 0) {
        _alert = "Only 4 Fours allowed!!";
      } else {
        _value += "4";
        _counter--;
      }
    });
  }

  void _backspace() {
    setState(() {
      int len = _value.length;
      if (int.tryParse(_value.substring(len-1)) != null) {
        _counter++;
      }
      _value = _value.substring(0, len-1);
    });
  }

  void hide() {
    setState(() {
      while(true) {
        if (!(_score == null)) {
          _hide = false;

          break;
        } else {
          _hide = true;
        }
      }
    });
  }

  void startTimer(int t) {
    _timer = Timer(new Duration(seconds: t), hide);
  }


  @override
  Widget build(BuildContext context) {
    Flame.audio.load('correct.mp3');
    _loadPage();
    SystemChrome.setEnabledSystemUIOverlays([]);
//    return new Scaffold(
//          backgroundColor: Color(0xffCED4CC),
//          body: _body
//    );
      startTimer(4);
      return new AnimatedOpacity(
        opacity: _hide ? 0.0 : 1.0,
        duration: Duration(milliseconds: 500),
        child: SplashScreen(
          seconds: 4,
          navigateAfterSeconds: new Scaffold(
          backgroundColor: Color(0xffCED4CC),
            body: _body
          ),
          image: new Image(image: AssetImage("assets/images/logo.gif")),
          backgroundColor: Color(0xffCED4CC),
          loaderColor: orange,
        )
      );
  }

  Widget genRow(String t1, Function f1, String t2, Function f2, String t3,
      Function f3) {
    return Row(
      children: <Widget>[
        newButton(t1, f1, lightGrey, darkGrey),
        newButton(t2, f2, lightGrey, darkGrey),
        newButton(t3, f3, lightGrey, darkGrey),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceAround,
    );
  }

  Widget newButton(String text, Function f, Color backgroundColor,
      Color textColor) {
    return RaisedButton(color: backgroundColor,
      shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0)),
      onPressed: f,
      child: Text("$text", style: TextStyle(fontSize: 24, color: textColor),),
      padding: EdgeInsets.all(15),);
  }

  Widget loadingPage() {
    return new Center(
      child: Column(
        children: <Widget>[
          CircularProgressIndicator(),
//          Image(image: AssetImage("assets/images/logo.gif")),
        ],
      )
    );
  }

  Widget gamePage() {
    return Padding(
        padding: EdgeInsets.only(top: MediaQuery
            .of(context)
            .size
            .height * 0.08),
        child: Center(
            child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text("Goal:"),
                          Text('$_goal',
                            style: Theme.of(context).textTheme.display2,),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text("Highscore:"),
                          Text('$_score',
                            style: Theme
                                .of(context)
                                .textTheme
                                .display2,),
                        ],
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  ),


                  Container(
                      color: Colors.transparent,
                      child: Container(
                        child: SizedBox(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.9,
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.1,
                            child: Center(
                              child: Text(
                                '$_value',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .display1,
                                textAlign: TextAlign.center,
                              ),
                            )
                        ),
                        decoration: BoxDecoration(
                            color: Color(0xff8D9687),
                            borderRadius: BorderRadius.circular(MediaQuery
                                .of(context)
                                .size
                                .width * 0.04)
                        ),
                      )

                  ),

                  Text(
                    "Fours Remaining: $_counter",
                    textAlign: TextAlign.center,
                  ),

//                Text('$_alert'),
                  SizedBox(
                    height: 500,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.88,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        genRow("²", _squared, ".", _decimal, "<", _backspace),
                        genRow("+", _plus, "-", _minus, "(", _openParen),
                        genRow("4", _four, "=", _equals, "C", _clear),
                        genRow("÷", _div, "x", _mult, ")", _closeParen),
                        genRow("!", _factorial, "^", _exp, "√", _sqrt)
                      ],
                    ),
                  ),

                ]
            )
        )
    );
  }

  _loadPage() async {
    await _getScore();
      setState(() {
        _body = gamePage();
    });

  }

  _getScore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey("score")) {
      await prefs.setInt("score", _goal);
    }
    _score = prefs.getInt("score");
  }

  _updateScore(int score) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (score > _score) {
      _getScore();
      await prefs.setInt('score', score);
      await prefs.commit();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }
}
=======
import 'dart:async';

import 'package:flame/flame.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:four/MathEngine.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Four Fours',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Four Fours'),

    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 4;
  String _value = "";
  int _goal = 0;
  int _score;
  int _computation;
  Widget _body;
  bool _hide = false;
  Color orange =  Color(0xffEE6E48);
  Color darkGrey = Color(0xff565C5C);
  Color lightGrey = Color(0xffCCD2C6);

  @override
  void initState() {
    super.initState();
    _body = loadingPage();
  }

  void _plus() {
    setState(() {
      _value+= "+";
    });
  }

  void correctSound() {
    Flame.audio.play("correct.mp3");
  }

  void squared() {
    setState(() {
      _value += '\u00B2';
    });
  }

  void _factorial() {
    setState(() {
      _value += '!';
    });
  }

  void _exp() {
    setState(() {
      _value+= "^";
    });
  }

  void _squared() {
    setState(() {
      _value += "²";
    });
  }

  void _minus() {
    setState(() {
      _value+="-";
    });
  }

  void _div() {
    setState(() {
      _value+="\u00F7";
    });
  }

  void _mult() {
    setState(() {
      _value+="x";
    });
  }

  void _sqrt() {
    setState(() {
      _value += '\u221a';
    });
  }

  void _openParen() {
    setState(() {
      _value+="(";
    });
  }

  void _closeParen() {
    setState(() {
      _value+=")";
    });
  }

  void _decimal() {
    setState(() {
      _value += ".";
    });
  }

  void _clear() {
    setState(() {
      _value = "";
      _counter = 4;
    });
  }

  void _addChar(String char) {
    setState(() {
      _value += char;
    });
  }

  void _equals() {
    setState(() {
      _computation = mathEngine(_value).round();
      if (_computation == _goal && _counter == 0) {
        _goal++;
        correctSound();
        _updateScore(_goal);
        _clear();
      } else {
        if(_counter != 0) {
          _value += "=$_computation";
        } else {
          _value += "=$_computation";
        }
      }
    });
  }

  void _four() {
    setState(() {
      if (!(_counter == 0)) {
        _value += "4";
        _counter--;
      }
    });
  }

  void _backspace() {
    setState(() {
      int len = _value.length;
      if (int.tryParse(_value.substring(len-1)) != null) {
        _counter++;
      }
      _value = _value.substring(0, len-1);
    });
  }

  void hide() {
    bool flag = true;
    setState(() {
      while (flag) {
        if (!(_score == null)) {
          _hide = true;
          break;
        }
      }
      _hide = true;
    });
  }

  void startTimer(int t) {
    Timer(new Duration(seconds: t), hide);
  }

  @override
  Widget build(BuildContext context) {
    Flame.audio.load('correct.mp3');
    _loadPage();
    SystemChrome.setEnabledSystemUIOverlays([]);
    startTimer(4); //TODO: Assign T value
    return new AnimatedOpacity(
        opacity: _hide ? 0.0 : 1.0,
        duration: Duration(milliseconds: 500),
        child: SplashScreen(
            seconds: 8,
            navigateAfterSeconds: new Scaffold(
                backgroundColor: Color(0xffCED4CC),
                body: _body
            ),
            image: new Image.asset('logo.png'),
            backgroundColor: lightGrey,
            styleTextUnderTheLoader: new TextStyle(),
            photoSize: 100.0,
            loaderColor: orange
        )
    );
  }

  Widget genRow(String t1, Function f1, String t2, Function f2, String t3,
      Function f3) {
    return Row(
      children: <Widget>[
        newButton(t1, f1, lightGrey, darkGrey),
        newButton(t2, f2, lightGrey, darkGrey),
        newButton(t3, f3, lightGrey, darkGrey),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceAround,
    );
  }

  Widget newButton(String text, Function f, Color backgroundColor,
      Color textColor) {
    return RaisedButton(color: backgroundColor,
      shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0)),
      onPressed: f,
      child: Text("$text", style: TextStyle(fontSize: 24, color: textColor),),
      padding: EdgeInsets.all(15),);
  }

  Widget loadingPage() {
    return new Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget gamePage() {
    return Padding(
        padding: EdgeInsets.only(top: MediaQuery
            .of(context)
            .size
            .height * 0.08),
        child: Center(
            child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text("Goal:"),
                          Text('$_goal',
                            style: Theme.of(context).textTheme.display2,),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text("Highscore:"),
                          Text('$_score',
                            style: Theme
                                .of(context)
                                .textTheme
                                .display2,),
                        ],
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  ),


                  Container(
                      color: Colors.transparent,
                      child: Container(
                        child: SizedBox(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.9,
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.1,
                            child: Center(
                              child: Text(
                                '$_value',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .display1,
                                textAlign: TextAlign.center,
                              ),
                            )
                        ),
                        decoration: BoxDecoration(
                            color: Color(0xff8D9687),
                            borderRadius: BorderRadius.circular(MediaQuery
                                .of(context)
                                .size
                                .width * 0.04)
                        ),
                      )

                  ),

                  Text(
                    "Fours Remaining: $_counter",
                    textAlign: TextAlign.center,
                  ),

//                Text('$_alert'),
                  SizedBox(
                    height: 500,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.88,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        genRow("²", _squared, ".", _decimal, "<", _backspace),
                        genRow("+", _plus, "-", _minus, "(", _openParen),
                        genRow("4", _four, "=", _equals, "C", _clear),
                        genRow("÷", _div, "x", _mult, ")", _closeParen),
                        genRow("!", _factorial, "^", _exp, "√", _sqrt)
                      ],
                    ),
                  ),

                ]
            )
        )
    );
  }

  _loadPage() async {
    await _getScore();
    setState(() {
      _body = gamePage();
    });
  }

  _getScore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey("score")) {
      await prefs.setInt("score", _goal);
    }
    _score = prefs.getInt("score");
  }

  _updateScore(int score) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (score > _score) {
      _getScore();
      await prefs.setInt('score', score);
      await prefs.commit();
    }
  }
}
>>>>>>> master
