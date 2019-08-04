import 'dart:collection';
import 'dart:math';

String postfix(String equation) {
  var operatorPrecedenceInStack = {"(":0,"√":5,"x":4,"÷":4,"+":2,"-":2};
  var operatorPrecedenceToStack = {"(":10,"√":6,"x":3,"÷":3,"+":1,"-":1}; //Out
  ListQueue operators = new ListQueue(); //Functioning as a queue
  ListQueue output = new ListQueue(); //Functioning as a stack
  while(equation.length > 0) {
    //If the first character is a number
    if (int.tryParse(equation.substring(0,1)) != null) {
      //Queue push
      output.addLast(equation.substring(0,1));
      //Remove the first string from the equation (SIDE EFFECT)
      equation = equation.substring(1);
    } else {
      //For the first operator
      if (operators.isEmpty) {
        //Stack push
        operators.addFirst(equation.substring(0,1));
        //Remove the first string from the equation (SIDE EFFECT)
        equation = equation.substring(1);
      } else { //If not the first operator
        //If its a closing parenthese
        if(equation.substring(0,1) == ")") {
          do {output.addLast(operators.removeFirst());}
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

int calculatePostfix(String equation) {
  ListQueue terms = new ListQueue(); //Functioning as a stack
  int ret = 0;

  while(equation.length > 0) {
    String symbol = equation.substring(0,1);
    if (int.tryParse(symbol) != null) {
      terms.addLast(int.parse(symbol));
      //Remove the first string from the equation (SIDE EFFECT)
      equation = equation.substring(1);
    }
    else
    {
      switch(symbol){
        case "x":
          int t1 = terms.removeLast();
          int t2 = terms.removeLast();
          terms.addLast(t1*t2);
          break;
        case "÷":
          int t1 = terms.removeLast();
          int t2 = terms.removeLast();
          terms.addLast(t1~/t2);
          break;
        case "+":
          int t1 = terms.removeLast();
          int t2 = terms.removeLast();
          terms.addLast(t1+t2);
          break;
        case "-":
          int t1 = terms.removeLast();
          int t2 = terms.removeLast();
          terms.addLast(t1-t2);
          break;
        case "√":
          int t = terms.removeLast();
          terms.addLast(sqrt(t).toInt());
          break;
      }

      //Remove the first string from the equation (SIDE EFFECT)
      equation = equation.substring(1);
    }
  }
  return terms.removeFirst();
}

int mathEngine(String s) {
  print(s);
  print(postfix(s));
  print(calculatePostfix(postfix(s)));
  return calculatePostfix(postfix(s));
}