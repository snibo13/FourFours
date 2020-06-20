import 'package:flutter/material.dart';
import 'utils.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text("Created by Sidney Nimako"),
            FlatButton(
              child: Text("snibo.me", style: TextStyle(decoration: TextDecoration.underline),),
              onPressed: () => launchSite("http://snibo.me"),
            ),
            FlatButton(
              child: Text("Support me", style: TextStyle(decoration: TextDecoration.underline)),
              onPressed: () => launchSite("https://www.paypal.me/snibo/4444"),
            )

          ],
        ),
      ),
    );
  }
}