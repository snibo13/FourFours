import 'dart:async';
import 'package:flame/flame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'MathEngine.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

Future<bool> _minTime = Future<bool>.delayed(
    Duration(seconds: 2),
        () => true
);

Color textColor = Color(0xff565C5C);
Color backgroundColor =  Color(0xffCCD2C6);


Widget newButton(String text, Function f) {
  return RaisedButton(
    color: backgroundColor,
    shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(18.0)),
    onPressed: f,
    child: Text("$text", style: TextStyle(fontSize: 24, color: textColor), ),
    padding: EdgeInsets.all(15),
    animationDuration: Duration(microseconds: 0),
  );
}

Widget helpElement(String head, String content) {
  return Card(
      color: Color(0xffCED4CC),
    child: ListTile (
      title: Text("$head", style: TextStyle(fontSize: 24),),
      subtitle: Text("$content", softWrap: true, style: TextStyle(fontSize: 18),),
    )
  );
}

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        color: Color(0xffCED4CC),
        child: ListView(
          children: <Widget>[
            Center(
                child: Text("Help", style: TextStyle(fontSize: 48, color: textColor))
            ),
            helpElement("+", "Addition"),
            helpElement("-", "Subtraction"),
            helpElement("x", "Multiplication"),
            helpElement("÷", "Division"),
            helpElement("<", "Backspace"),
            helpElement("!", "The ! or factorial is a single number operation. Unlike addition where you need two numbers, factorial only needs one. n! is equal to all the numbers from 1 to n multiplied. For example, 4! = 1 x 2 x 3 x 4 = 24"),
            helpElement("²", "\"²\" or the squared operations is a single number operation. Unlike subtraction where you need two numbers, squaring only needs one. Squaring is part of a type of operations called exponentials. n² is equal to the number times it self. For example, 4² = 4 x 4 = 16. In general, an exponential multiplies the number by itself however many times the little number says. For example, 4³ = 4 x 4 x 4 = 64."),
            helpElement("^", "The \"^\" is the symbol for exponentials. It is a lot simpler to write a carat then a little number for computers, so we use the carat. The number after the carat works just like the little number. For example, 4^2 = 4² = 4 x 4 = 16 and 4^3 = 4³ = 4 x 4 x 4 = 64."),
            helpElement("√", "The √ or square root symbol is the opposite of the ² symbol. Unlike multiplication where you need two numbers, the square root only needs one. The √ asks what number can be multiplied by itself to equal n. For example √4 = 2 because 2² = 2 x 2  = 4")
          ],
        ),
      ),
    );
  }
}


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
      home: Menu(),
      routes: {
        'Play': (BuildContext context) => MyHomePage(gameType: 1),
        'Arcade': (BuildContext context) => MyHomePage(gameType: 2),
        'Help': (BuildContext context) => Help(),
      },
//      home: MyHomePage(title: 'Four Fours'),
    );
  }
}

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: _minTime,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
      Widget _body;
      if (snapshot.hasData) {
        _body = Container(
          color: Color(0xffCED4CC),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Image(image: AssetImage("assets/images/logo.png"), height: 200.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  newButton("Play", () =>
                      Navigator.of(context).pushNamed('Play')
                  ),
                  newButton("Arcade", () =>
                      Navigator.of(context).pushNamed('Arcade')
                  ),
                  newButton("Learn", () => {
                    Navigator.of(context).pushNamed('Help')
                  }),



                ],
              )
            ],
          ),
        );
      } else {
        _body = new Scaffold (
          backgroundColor: Color(0xffCED4CC),
         body: Container(
            color: Color(0xffCED4CC),
            child: Center(
              child:  Image(image: AssetImage("assets/images/logo.gif"), height: 200.0),
            )
           )
          );
      }
      return _body;
  });
}
}


class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
        color: Color(0xffCED4CC),
        child: Center(
          child:  Image(image: AssetImage("assets/images/logo.gif"), height: 200.0),
        )
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
    this.gameType
  }): super(key: key);

  final int gameType;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State < MyHomePage > {
  int _counter = 4;
  String _value = "";
  int _goal = 0;
  int _score;
  int _computation;

  Color orange = Color(0xffEE6E48);
  Color darkGrey = Color(0xff565C5C);
  Color lightGrey = Color(0xffCCD2C6);

  @override
  void initState() {
    super.initState();
  }

  void _plus() {
    setState(() {
      _value += "+";
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
      _value += "^";
    });
  }

  void _squared() {
    setState(() {
      _value += "²";
    });
  }

  void _minus() {
    setState(() {
      _value += "-";
    });
  }

  void _div() {
    setState(() {
      _value += "\u00F7";
    });
  }

  void _mult() {
    setState(() {
      _value += "x";
    });
  }

  void _sqrt() {
    setState(() {
      _value += '\u221a';
    });
  }

  void _openParen() {
    setState(() {
      _value += "(";
    });
  }

  void _closeParen() {
    setState(() {
      _value += ")";
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
        if (_counter != 0) {
          _value += "=$_computation";
        } else {
          _value += "=$_computation";
        }
      }
    });
  }

  void _four() {
    setState(() {
      if (_counter == 0) {
      } else {
        _value += "4";
        _counter--;
      }
    });
  }

  void _backspace() {
    setState(() {
      int len = _value.length;
      if (int.tryParse(_value.substring(len - 1)) != null) {
        _counter++;
      }
      _value = _value.substring(0, len - 1);
    });
  }





  @override
  Widget build(BuildContext context) {
    Flame.audio.load('correct.mp3');
    SystemChrome.setEnabledSystemUIOverlays([]);
    _loadPage();
    return FutureBuilder<bool>(
      future: _minTime,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        Widget _body;
        if (snapshot.hasData) {
          _body = gamePage();
        }
        else {
          _body = new Container(
              color: Color(0xffCED4CC),
              child: Center(
                child:  Image(image: AssetImage("assets/images/logo.gif"), height: 200.0),
              )
          );
        }
        return new Scaffold(
          backgroundColor: Color(0xffCED4CC),
          body: _body
        );
      },
    );
//    startTimer(4);
    //return new Scaffold(
      //backgroundColor: Color(0xffCED4CC),
      //body: gamePage(),
    //);

  }

  Widget genRow(String t1, Function f1, String t2, Function f2, String t3,
      Function f3) {
    return Row(
      children: < Widget > [
        newButton(t1, f1, lightGrey, darkGrey),
        newButton(t2, f2, lightGrey, darkGrey),
        newButton(t3, f3, lightGrey, darkGrey),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceAround,
    );
  }

  Widget newButton(String text, Function f, Color backgroundColor,
      Color textColor) {
    return RaisedButton(
      color: backgroundColor,
      shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0)),
      onPressed: f,
      child: Text("$text", style: TextStyle(fontSize: 24, color: textColor), ),
      padding: EdgeInsets.all(15),
      animationDuration: Duration(microseconds: 0),
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
                children: < Widget > [
                  Row(
                    children: < Widget > [
                      Column(
                        children: < Widget > [
                          Text("Goal:"),
                          Text('$_goal',
                            style: Theme.of(context).textTheme.display2, ),
                        ],
                      ),
                      Column(
                        children: < Widget > [
                          Text("Highscore:"),
                          Text('$_score',
                            style: Theme
                                .of(context)
                                .textTheme
                                .display2, ),
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
                      children: < Widget > [
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
    if (widget.gameType == 1) { //Normal
     _goal = _score + 1;
    }
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
  }
}