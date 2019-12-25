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


class HelpScreen extends StatelessWidget {
  final List<Operation> operations;

  HelpScreen(operations);

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


List<Operation> operations = [
  new Operation(title: "Rules", description: "You must use four fours to reach "
      "your goal. See how far you can get"),
  new Operation(title: "Hints"),
  new Operation(
      title: "squared (²) ", description: 'This operation squares the '
      'input.\nExample: 4² = 16'),
  new Operation(
      title: "factorial (!)", description: 'This operation multiplies '
      'all the integers between the input and 1.\nExample: 4! = 4 * 3 * 2 * 1 = 24'),
  new Operation(
      title: "Order of Operations", description: 'Order of operations '
      'determines the sequence that operations are evaluated. The sequence '
      'goes:\nParentheses (,)\nExponents √,²,^\n Multiplication and Division\n'
      'Addition and Subtraction')

]