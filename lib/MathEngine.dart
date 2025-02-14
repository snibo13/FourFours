import 'dart:collection';
import 'dart:math';
//TODO: Implement place value multiplication for numbers greater than 9
String postfix(String equation) {
  var operatorPrecedenceInStack = {
    "(": 0,
    "!": 7,
    "²": 5,
    "√": 5,
    "x": 4,
    "÷": 4,
    "+": 2,
    "-": 2
  };
  var operatorPrecedenceToStack = {
    "(": 10,
    "!": 8,
    "²": 6,
    "√": 6,
    "x": 3,
    "÷": 3,
    "+": 1,
    "-": 1
  };

  ListQueue operators = new ListQueue(); //Functioning as a queue
  ListQueue output = new ListQueue(); //Functioning as a stack
  //Cleaning input
  equation = equation.replaceAll(" ", "");

  //Iterating over equation
  while (equation.length > 0) {
    int numIndex = 0;
    //Keep increasing number range until failure
    while (numIndex + 1 <= equation.length && double.tryParse(equation.substring(0, numIndex + 1)) != null) {
      numIndex++;
    }

    if (numIndex != 0) { //Substring represents a number and not an operation
      //Queue push
      //Add the number to the end of the output list
      output.addLast(equation.substring(0, numIndex));
      //Add a space
      output.addLast(" ");
      //Remove the first string from the equation (SIDE EFFECT)
      //Truncation
      equation = equation.substring(numIndex);
    } else {
      //For the first operator
      if (operators.isEmpty) {
        //Stack push
        operators.addFirst(equation.substring(0, 1));
        //Remove the first character from the equation (SIDE EFFECT)
        equation = equation.substring(1);
      } else { //If not the first operator
        //If its a closing parenthesis
        if (equation.substring(0, 1) == ")") {
          do {
            output.addLast(operators.removeFirst());
          }
          while (operators.first != "(");
          operators.removeFirst();
          //Remove the first string from the equation (SIDE EFFECT)
          equation = equation.substring(1);
          continue;
        }
        if (operatorPrecedenceToStack[equation.substring(0, 1)] > operatorPrecedenceInStack[operators.first]) {
          //Stack push
          operators.addFirst(equation.substring(0, 1));
          //Remove the first string from the equation (SIDE EFFECT)
          equation = equation.substring(1);
        } else {
          while (operatorPrecedenceToStack[equation.substring(0, 1)] < operatorPrecedenceInStack[operators.first] && operators.isNotEmpty) {

            //Pop all operators with higher precedence to the output
            output.addLast(operators.removeFirst());
            //Space after operators
            output.addLast(" ");
            if (operators.isEmpty) {
              break;
            }
          }
          operators.addFirst(equation.substring(0, 1));
          //Remove the first string from the equation (SIDE EFFECT)
          equation = equation.substring(1);
        }
      }
    }
  }
  String out = "";
  while (operators.isNotEmpty) {
    output.addLast(operators.removeFirst());
  }
  while (output.isNotEmpty) {
    out += output.removeFirst();
  }
  print(out);
  return out;
}



double calculatePostfix(String equation) {
  ListQueue terms = new ListQueue(); //Functioning as a stack
  int symbolIndex = 0;
  //print(equation);
  //Convert equation to array
  List < String > eq = equation.split(" ");
  ListQueue < String > operations = new ListQueue < String > ();

  for (int i = 0; i < eq.length; i++) {
    var el = eq[i];
    if (double.tryParse(el) != null) {
      terms.addLast(double.tryParse(el));
    } else {
      operations.addLast(el);
    }
  }

  var symbol;

  int iterCount = operations.length;

  for (int j = 0; j < iterCount; j++) {


    var symbol = operations.removeFirst();
    switch (symbol) {
      case "x":
        double t1 = terms.removeLast();
        double t2 = terms.removeLast();
        terms.addLast(t1 * t2);
        break;
      case "÷":
        double t1 = terms.removeLast();
        double t2 = terms.removeLast();
        if (t1 < t2) {
          terms.addLast(t2 / t1);
        } else {
          terms.addLast(t1 / t2);
        }
        break;
      case "+":
        double t1 = terms.removeLast();
        double t2 = terms.removeLast();
        terms.addLast(t1 + t2);
        break;
      case "-":
        double t2 = terms.removeLast();
        double t1 = terms.removeLast();
        if (t2 > t1) {
          terms.addLast(t2 - t1);
        } else {
          terms.addLast(t1 - t2);
        }
        break;
      case "√":
        double t = terms.removeLast();
        terms.addLast(sqrt(t).toDouble());
        break;
      case "²":
        double t = terms.removeLast();
        terms.addLast(t * t);
        break;
      case "!":
        double t = terms.removeLast();
        terms.addLast(factorial(t));
        break;
    }

  }
  return terms.removeLast();

}

double factorial(double f) {
  if (f == 0) {
    return 1.0;
  }
  return f * factorial(f - 1);
}

double mathEngine(String s) {
  //print(postfix(s));
  return calculatePostfix(postfix(s));
}


void main() {
  print(mathEngine("22+22+4+78"));
}