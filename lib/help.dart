import 'dart:ui';

import 'package:flutter/material.dart';

class Operation {
  String title, description;

  Operation({this.title, this.description});
}

class OperationCard extends StatefulWidget {
  final Operation operation;

  OperationCard(this.operation)

  @override
  _OperationCardState createState() => _OperationCardState(operation);
}

class _OperationCardState extends State<OperationCard> {
  Operation op;
  TextStyle titleStyle = new TextStyle(fontSize: 16.0,
      fontWeight: FontWeight.bold, decoration: TextDecoration.underline);
  TextStyle descriptionStyle = new TextStyle(fontSize: 12.0);

  _OperationCardState(this.op);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(op.title, style: titleStyle),
          Text(op.description, style: descriptionStyle),
        ],
      ),
    );
  }
}


class HelpScreen extends StatefulWidget {
  2

  HelpScreen();

  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  ListView _buildList(context) {
    return ListView.builder(
        itemCount: operations.length,
        itemBuilder: (context, i) {
          return OperationCard(operations[i]);
        }
    );
  }
}


