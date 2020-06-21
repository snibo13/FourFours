import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

int minTime = 4;

Future<void> launchSite(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw "Cannot open URL";
  }
  return;
}

Widget newButton(String text, Function f, BuildContext context) {
  return RaisedButton(
    color: Theme.of(context).accentColor,
    shape:
        RoundedRectangleBorder(borderRadius: new BorderRadius.circular(18.0)),
    onPressed: f,
    child: Text(
      "$text",
      style: TextStyle(
          fontSize: 24, color: Theme.of(context).textTheme.bodyText1.color),
    ),
    padding: EdgeInsets.all(15),
    animationDuration: Duration(microseconds: 1),
  );
}

Widget helpElement(String head, String content, BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(15.0),
    child: Card(
        elevation: 0.0,
        color: Theme.of(context).backgroundColor,
        child: ListTile(
          title: Text(
            "$head",
            style: TextStyle(fontSize: 24),
          ),
          subtitle: Text(
            "$content",
            softWrap: true,
            style: TextStyle(fontSize: 18),
          ),
        )),
  );
}
