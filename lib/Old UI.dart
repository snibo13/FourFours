import 'package:flutter/material.dart';
Widget UI() {return Row(
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
)}