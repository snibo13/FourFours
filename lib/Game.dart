import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flame/flame.dart';
import 'package:flutter/services.dart';

import 'MathEngine.dart';
import 'utils.dart';

class GamePage extends StatefulWidget {
  GamePage({
    Key key,
    this.gameType
  }): super(key: key);

  final int gameType;

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State < GamePage > {
  int _counter = 4;
  String _value = "";
  int _goal = 0;
  int _score;
  int _computation;

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
      future:
      Future<bool>.delayed(
          Duration(seconds: minTime),
              () => true
      ),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        Widget _body;
        if (snapshot.hasData) {
          _body = gamePage();
        }
        else {
          _body = new Container(
              color: Theme.of(context).accentColor,
              child: Center(
                child:  Image(image: AssetImage("assets/images/logo.gif"), height: 200.0),
              )
          );
        }
        return new Scaffold(
            backgroundColor: Theme.of(context).accentColor,
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
        newButton(t1, f1, Theme.of(context).backgroundColor, Theme.of(context).textTheme.bodyText1.color),
        newButton(t2, f2, Theme.of(context).backgroundColor, Theme.of(context).textTheme.bodyText1.color),
        newButton(t3, f3, Theme.of(context).backgroundColor, Theme.of(context).textTheme.bodyText1.color),
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
      child: Text("$text", style: TextStyle(fontSize: 24, color: Theme.of(context).textTheme.bodyText1.color), ),
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
                              style: Theme.of(context).textTheme.headline3),
                        ],
                      ),
                      Column(
                        children: < Widget > [
                          Text("Highscore:"),
                          Text('$_score', style: Theme.of(context).textTheme.headline3,),
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
                                    .headline4,
                                textAlign: TextAlign.center,
                              ),
                            )
                        ),
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColorDark,
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
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}