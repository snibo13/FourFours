import 'package:flutter/material.dart';
import 'utils.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: Future<bool>.delayed(
            Duration(seconds: minTime),
                () => true
        ),
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
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 15.0),
                          child:newButton("Play", () =>
                              Navigator.of(context).pushNamed('Play'),
                            context
                          ),),
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 15.0),
                          child:
                          newButton("Arcade", () =>
                              Navigator.of(context).pushNamed('Arcade'),
                            context
                          ),),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        child: newButton("Learn", () =>
                            Navigator.of(context).pushNamed('Help'),
                          context
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        child: newButton("About", () =>
                            Navigator.of(context).pushNamed('About'),
                          context
                        ),
                      ),
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
