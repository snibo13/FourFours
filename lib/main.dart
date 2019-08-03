import 'package:flutter/material.dart';
//import 'MathString.dart';
import 'MathEngine.dart';
import 'package:flutter/services.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _computation;
  String _alert = " ";

  void _plus() {
    setState(() {
      _value+= "+";
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

  void _clear() {
    setState(() {
      _value = "";
      _counter = 4;
    });
  }

  void _equals() {
    setState(() {
      _computation = MathEngine(_value);
      if (_computation == _goal) {
        _goal++;
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
        _counter--;
      }
      _value = _value.substring(0, len-1);
    });
  }



  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
        backgroundColor: Color(0xffCED4CC),
        body: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.08),
          child: Center(
            child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text("Goal:"),
                    Text('$_goal',
                      style: Theme.of(context).textTheme.display2,),
                  ],
                ),

                Container(
                    color: Colors.transparent,
                    child: Container(
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: Center(
                            child: Text(
                              '$_value',
                              style: Theme.of(context).textTheme.display1,
                              textAlign: TextAlign.center,
                            ),
                          )
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xff8D9687),
                          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.04)
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
                    width: MediaQuery.of(context).size.width * 0.88,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Row(
                            children: <Widget> [
                              Expanded (
                                  flex: 3,
                                  child: Padding(
                                      padding: EdgeInsets.only(left: 10, right: 10),
                                      child: RaisedButton(
                                        color: Color(0xffEE6E48),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                          onPressed: _four, child: Text("4", style: TextStyle(fontSize: 25, color: Color(0xff565C5C))),padding: EdgeInsets.all(11.5),)),
                              ),
                              Expanded (
                                  flex: 3,
                                  child: Padding(
                                      padding: EdgeInsets.only(left: 10, right: 10),
                                      child: RaisedButton(
                                        color: Color(0xffEE6E48),
                                        shape: RoundedRectangleBorder(borderRadius:
                                        BorderRadius.circular(30)),
                                        onPressed: _equals,
                                        child: Text("=", style: TextStyle(fontSize: 28, color: Color(0xff565C5C)),),
                                        padding: EdgeInsets.all(10),))
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly
                        ),
                        Row(children: <Widget>[
                          RaisedButton(color: Color(0xffCCD2C6), shape: CircleBorder(), onPressed: _plus, child: Text("+", style: TextStyle(fontSize: 24, color: Color(0xff565C5C)),), padding: EdgeInsets.all(15),),
                          RaisedButton(color: Color(0xffCCD2C6), shape: CircleBorder(), onPressed: _minus, child: Text("-", style: TextStyle(fontSize: 24, color: Color(0xff565C5C)),), padding: EdgeInsets.all(15),),
                          RaisedButton(color: Color(0xffCCD2C6), shape: CircleBorder(), onPressed: _backspace, child: Text("DEL", style: TextStyle(fontSize: 24, color: Color(0xff565C5C)),), padding: EdgeInsets.all(15),),
                        ],mainAxisAlignment: MainAxisAlignment.spaceEvenly,),
                        Row(children: <Widget>[
                          RaisedButton(color: Color(0xffCCD2C6),shape: CircleBorder(), onPressed: _mult, child: Text("x", style: TextStyle(fontSize: 24, color: Color(0xff565C5C)),), padding: EdgeInsets.all(15),),
                          RaisedButton(color: Color(0xffCCD2C6),shape: CircleBorder(), onPressed: _div, child: Text("\u00F7", style: TextStyle(fontSize: 24, color: Color(0xff565C5C)),), padding: EdgeInsets.all(15),),
                          RaisedButton(color: Color(0xffCCD2C6),shape: CircleBorder(), onPressed: _clear, child: Text("C", style: TextStyle(fontSize: 24, color: Color(0xff565C5C)),), padding: EdgeInsets.all(15),),

                        ],mainAxisAlignment: MainAxisAlignment.spaceEvenly,),

                        Row(children: <Widget>[
                          RaisedButton(color: Color(0xffCCD2C6),shape: CircleBorder(), onPressed: _sqrt, child: Text("\u221a", style: TextStyle(fontSize: 24, color: Color(0xff565C5C)),), padding: EdgeInsets.all(15),),
                          RaisedButton(color: Color(0xffCCD2C6),shape: CircleBorder(), onPressed: _openParen, child: Text("(" , style: TextStyle(fontSize: 24, color: Color(0xff565C5C)),), padding: EdgeInsets.all(15),),
                          RaisedButton(color: Color(0xffCCD2C6),shape: CircleBorder(), onPressed: _closeParen, child: Text(")", style: TextStyle(fontSize: 24, color: Color(0xff565C5C)),), padding: EdgeInsets.all(15),),
                        ],mainAxisAlignment: MainAxisAlignment.spaceEvenly,),
                      ],
                    )
                )
              ],
            ),
          ),
        )
    );
  }
}
