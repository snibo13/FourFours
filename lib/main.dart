import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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

  void _plus() {
    setState(() {
      _value+= "+";
      _counter--;
    });
  }

  void _minus() {
    setState(() {
      _value+="-";
      _counter--;
    });
  }

  void _div() {
    setState(() {
      _value+="/";
      _counter--;
    });
  }

  void _mult() {
    setState(() {
      _value+="x";
      _counter--;
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

      if (value == _goal) {
        _goal++;
        _clear();
      }
    });
  }

  void _four() {
    setState(() {
      _value += "4";
    });
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
               title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('$_goal'),
            Text(
              '$_value',
              style: Theme.of(context).textTheme.display1,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            RaisedButton(onPressed: _plus, child: Text("+"),),
            RaisedButton(onPressed: _mult, child: Text("x"),),
            RaisedButton(onPressed: _clear, child: Text("C")),
            RaisedButton(onPressed: _minus, child: Text("-")),
            RaisedButton(onPressed: _div, child: Text("/")),
            RaisedButton(onPressed: _equals, child: Text("=")),
            RaisedButton(onPressed: _four, child: Text("4"),)
          ],
        ),
      ),
    );
  }
}
