import 'package:flutter/material.dart';
import 'utils.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        color: Color(0xffCED4CC),
        child: ListView(
          children: <Widget>[
            Center(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text("Learn", style: TextStyle(fontSize: 48, color: Theme.of(context).textTheme.bodyText1.color)),
                )
            ),
            helpElement("!", "The ! or factorial is a single number operation.\nUnlike addition where you need two numbers, factorial only needs one.\n n! is equal to all the numbers from 1 to n multiplied.\n For example, 4! = 1 x 2 x 3 x 4 = 24", context),
            helpElement("²", "\"²\" or the squared operations is a single number operation.\nUnlike subtraction where you need two numbers, squaring only needs one.\nSquaring is part of a type of operations called exponentials.\nn² is equal to the number times it self.\nFor example, 4² = 4 x 4 = 16.\nIn general, an exponential multiplies the number by itself however many times the little number says.\nFor example, 4³ = 4 x 4 x 4 = 64.", context),
            helpElement("^", "The \"^\" is the symbol for exponentials.\nIt is a lot simpler to write a carat then a little number for computers, so we use the carat.\nThe number after the carat works just like the little number.\nFor example, 4^2 = 4² = 4 x 4 = 16 and 4^3 = 4³ = 4 x 4 x 4 = 64.", context),
            helpElement("√", "The √ or square root symbol is the opposite of the ² symbol.\nUnlike multiplication where you need two numbers, the square root only needs one.\nThe √ asks what number can be multiplied by itself to equal n.\nFor example √4 = 2 because 2² = 2 x 2  = 4", context)
          ],
        ),
      ),
    );
  }
}