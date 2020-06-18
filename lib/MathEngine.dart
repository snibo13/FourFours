import 'dart:collection';
import 'dart:math';
//TODO: Implement place value multiplication for numbers greater than 9
String postfix(String equation) {
  var operatorPrecedenceInStack = {"(":0,"!":7,"²":5,"√":5,"x":4,"÷":4,"+":2,"-":2};
  var operatorPrecedenceToStack = {"(":10,"!":8,"²":6,"√":6,"x":3,"÷":3,"+":1,"-":1}; //Out
  ListQueue operators = new ListQueue(); //Functioning as a queue
  ListQueue output = new ListQueue(); //Functioning as a stack
  equation = equation.replaceAll(" ","");
  while(equation.length > 0) {
    //Adding double digit functionality
    int numIndex = 0;
    //If the first character is a number
    //Accomodates for numbers of variable lengths
    if (equation.length >= 3 && equation.substring(0,3).contains(".") && double.tryParse(equation.substring(0,3)) != null) {
      numIndex = 3;
    }
    else if (equation.length >= 2 && equation.substring(0,2).contains(".") && double.tryParse(equation.substring(0,2)) != null) {
      numIndex = 2;
    }  else if (double.tryParse(equation.substring(0,1)) != null) {
      numIndex = 1;
    }
    if (numIndex != 0) {
      //Queue push
      output.addLast(equation.substring(0,numIndex));
      //Remove the first string from the equation (SIDE EFFECT)
      equation = equation.substring(numIndex);
    } else {
      //For the first operator
      if (operators.isEmpty) {
        //Stack push
        operators.addFirst(equation.substring(0,1));
        //Remove the first string from the equation (SIDE EFFECT)
        equation = equation.substring(1);
      } else { //If not the first operator
        //If its a closing parenthesis
        if(equation.substring(0,1) == ")") {
          do {
            output.addLast(operators.removeFirst());
          }
          while (operators.first != "(");
          operators.removeFirst();
          //Remove the first string from the equation (SIDE EFFECT)
          equation = equation.substring(1);
          continue;
        }
        if (operatorPrecedenceToStack[equation.substring(0,1)] > operatorPrecedenceInStack[operators.first]) {
          //Stack push
          operators.addFirst(equation.substring(0,1));
          //Remove the first string from the equation (SIDE EFFECT)
          equation = equation.substring(1);
        }
        else {
          while(operatorPrecedenceToStack[equation.substring(0,1)] < operatorPrecedenceInStack[operators.first] && operators.isNotEmpty) {
            //Pop all operators with higher precedence to the output
            output.addLast(operators.removeFirst());
            if(operators.isEmpty) {
              break;
            }
          }
          operators.addFirst(equation.substring(0,1));
          //Remove the first string from the equation (SIDE EFFECT)
          equation = equation.substring(1);
        }
      }
    }
  }
  String out = "";
  while(operators.isNotEmpty) {
    output.addLast(operators.removeFirst());
  }
  while(output.isNotEmpty) {
    out += output.removeFirst();
  }
  return out;
}

double calculatePostfix(String equation) {
  ListQueue terms = new ListQueue(); //Functioning as a stack
  int symbolIndex = 0;
  equation = equation.replaceAll(" ","");
  //Compensates for numbers of variable length
  while(equation.length > 0) {
    //Three digits only possible with decimals
    if(equation.length >= 3 && (equation.substring(0,3)).contains(".") && double.tryParse(equation.substring(0,3)) != null) {
      symbolIndex = 3;
    } else if(equation.length >=2 && equation.substring(0,2).contains(".") && double.tryParse(equation.substring(0,2)) != null) {
      symbolIndex = 2;
    } else {
      symbolIndex = 1;
    }
    String symbol = equation.substring(0,symbolIndex);
    if (double.tryParse(symbol) != null) {
      terms.addLast(double.parse(symbol));
      //Remove the first string from the equation (SIDE EFFECT)
      equation = equation.substring(symbolIndex);
    }
    else
    {
      switch(symbol){
        case "x":
          double t1 = terms.removeLast();
          double t2 = terms.removeLast();
          terms.addLast(t1*t2);
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
          terms.addLast(t1+t2);
          break;
        case "-":
          double t2 = terms.removeLast();
          double t1 = terms.removeLast();
          if (t2 > t1) {
            terms.addLast(t2 - t1);
          }else {
            terms.addLast(t1-t2);
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

      //Remove the first string from the equation (SIDE EFFECT)
      equation = equation.substring(symbolIndex);
    }
  }
  return terms.removeFirst();
}

double factorial(double f) {
  if (f == 0) {
    return 1.0;
  }
  return f * factorial(f-1);
}

double mathEngine(String s) {
  //print(postfix(s));
  return calculatePostfix(postfix(s));
}
