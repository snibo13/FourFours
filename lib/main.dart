import 'package:flutter/material.dart';
import 'MathString.dart';

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
      _counter = 0;
    });
  }

  void _equals() {
    setState(() {
      _computation = parseEquation(_value);
      if (_computation == _goal) {
        _goal++;
        _clear();
      } else {
        if(_counter != 4) {
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
      if (_counter < 4) {
        _value += "4";
        _counter++;
      } else {
        _alert = "Only 4 Fours allowed!!";
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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('$_goal',
            style: Theme.of(context).textTheme.display2,),
            Text(
              '$_value',
              style: Theme.of(context).textTheme.display1,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            Text('$_alert'),
            SizedBox(
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(onPressed: _four, child: Text("4"),),
                  RaisedButton(onPressed: _backspace, child: Text("<DEL"),),
                  Row(children: <Widget>[
                    RaisedButton(onPressed: _sqrt, child: Text("\u221a"),),
                    RaisedButton(onPressed: _mult, child: Text("x"),),
                    RaisedButton(onPressed: _div, child: Text("\u00F7")),
                  ],mainAxisAlignment: MainAxisAlignment.spaceEvenly,),
                  Row(children: <Widget>[
                    RaisedButton(onPressed: _clear, child: Text("C")),
                    RaisedButton(onPressed: _plus, child: Text("+"),),
                    RaisedButton(onPressed: _minus, child: Text("-")),
                  ],mainAxisAlignment: MainAxisAlignment.spaceEvenly,),
                  Row(children: <Widget>[
                    RaisedButton(onPressed: _equals, child: Text("=")),
                    RaisedButton(onPressed: _openParen, child: Text("("),),
                    RaisedButton(onPressed: _closeParen, child: Text(")")),
                  ],mainAxisAlignment: MainAxisAlignment.spaceEvenly,),
                ],
              )
            )







          ],
        ),
      ),
    );
  }
}
