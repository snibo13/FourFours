void main() {
  print(parseEquation("4x4"));
  print(parseEquation("(4x4)"));
  print(parseEquation("16÷16"));
  print(parseEquation("(4x4)÷(4x4)"));
  //print(parseEquation("4+4-√4-√4"));
  print(parseEquation("(4+4)-(4+4)"));

}

int parseEquation(String equation) {
  var values = [];
  int val = 0;
  if (!equation.contains("(")) {
    return oop(equation);
  }
  while (equation.contains('(')) {
    values.add(oop(equation.substring(equation.indexOf('(')+1, equation.indexOf(')'))));
    var temp = values[values.length-1];
    equation = equation.replaceRange(equation.indexOf('('), equation.indexOf(')')+1,"$temp");
  }
  if(int.tryParse(equation) == null) {
    return parseEquation(equation);
  } else {
    for (int i = 0; i < values.length; i++) {
      val += values[i];
    }
    return val;
  }

}

int calculate(int opIndex, String subEquation) {
  //Remove all spaces
  subEquation = subEquation.replaceAll(" ","");
  //Value to be returned
  int val = int.parse(subEquation.substring(0,opIndex));
  //Iterate through the subEquation performing operations as seen
  while(subEquation.length >= 1) {
    switch (subEquation.substring(0,1)) {
      case '÷':
        val ~/= int.parse(subEquation.substring(opIndex-1));
        break;
      case 'x':
        val *= int.parse(subEquation.substring(opIndex));
        break;
      case '+':
        val += int.parse(subEquation.substring(opIndex));
        break;
      case '-':
        val -= int.parse(subEquation.substring(opIndex));
        break;
    }
    //Remove the first character in the equation
    subEquation = subEquation.substring(1);
  }

  //Return the computed value
  return val;
}

int oop(String subEquation) {
  var values = [];
  int val = 0;
  while (subEquation.contains('\u221a')) {
    subEquation = subEquation.replaceRange(subEquation.indexOf('\u221a'), subEquation.indexOf('\u221a')+2,"2");
  }
  subEquation = oopPair(subEquation,"\u00F7", "x");
  subEquation = oopPair(subEquation,"+", "-");
  return int.parse(subEquation);
}

List digOp(String op, String equation) {
  List vals = [];
  int startIndex = 1;
  int opIndex = equation.indexOf(op);
  int endIndex = opIndex + 1;
  if (opIndex - 2 >= 0 && int.tryParse(equation.substring(opIndex -2, opIndex)) != null) {
    startIndex = opIndex - 2;
  }
  if (opIndex + 3 <= equation.length && int.tryParse(equation.substring(opIndex+1, opIndex+3)) != null) {
    endIndex = opIndex + 3;
  }
  return [startIndex, endIndex];
}
bool isDoubleDigit(String s, int index) {
  if (int.tryParse(s.substring(index, index+3)) != null) {
    return true;
  }
  return false;
}

int calculate2(String subEquation) {
  //Remove all spaces
  subEquation = subEquation.replaceAll(" ","");
  //Value to be returned
  int val;
  //Array of values for order of operations
  var values = [];
  //If the first number is two digits
  if (int.tryParse(subEquation.substring(0,2)) != null) {
    val = int.parse(subEquation.substring(0,2));
  }
  else {
    val = int.parse(subEquation.substring(0,1));
  }
  //Iterate through the subEquation performing operations as seen
  while(subEquation.length >= 1) {
    switch (subEquation.substring(0,1)) {
      case '/':
        val ~/= int.parse(subEquation.substring(1,2));
        subEquation = subEquation.substring(1);
        break;
      case 'x':
        val *= int.parse(subEquation.substring(1,2));
        subEquation = subEquation.substring(1);
        break;
      case '+':
        val += int.parse(subEquation.substring(1,2));
        subEquation = subEquation.substring(1);
        break;
      case '-':
        val -= int.parse(subEquation.substring(1,2));
        subEquation = subEquation.substring(1);
        break;
    }
    //Remove the first character in the equation
    subEquation = subEquation.substring(1);
  }

  //Return the computed value
  return val;
}

String oopPair(String subEquation, String char1, String char2) {
  int temp;
  while(subEquation.contains(char1) || subEquation.contains(char2)) {
    if (subEquation.contains(char2)) {
      if (subEquation.contains(char1)) {
        if(subEquation.indexOf(char2) < subEquation.indexOf(char1)) {
          if (subEquation.length > 3) {
            List indeces = digOp(char2, subEquation);
            temp = calculate(subEquation.indexOf(char2), subEquation.substring(indeces[0], indeces[1]));
            subEquation = subEquation.replaceRange(indeces[0],indeces[1],"$temp");
          } else {
            temp = calculate2(subEquation.substring(subEquation.indexOf(char2)-1, subEquation.indexOf(char2)+2));
            subEquation = subEquation.replaceRange(subEquation.indexOf(char2)-1, subEquation.indexOf(char2)+2,"$temp");
          }
        }
        else {
          if (subEquation.length > 3) {
            List indeces = digOp(char1, subEquation);
            temp = calculate(subEquation.indexOf(char1), subEquation.substring(indeces[0], indeces[1]));
            subEquation = subEquation.replaceRange(indeces[0],indeces[1],"$temp");
          } else {
            temp = calculate2(subEquation.substring(subEquation.indexOf(char1)-1, subEquation.indexOf(char1)+2));
            subEquation = subEquation.replaceRange(subEquation.indexOf(char1)-1, subEquation.indexOf(char1)+2,"$temp");
          }
        }
      }
      else {
        if (subEquation.length > 3) {
          List indeces = digOp(char2, subEquation);

          temp = calculate(subEquation.indexOf(char2), subEquation.substring(indeces[0], indeces[1]));
          subEquation = subEquation.replaceRange(indeces[0],indeces[1],"$temp");
        } else {
          temp = calculate2(subEquation.substring(subEquation.indexOf(char2)-1, subEquation.indexOf(char2)+2));
          subEquation = subEquation.replaceRange(subEquation.indexOf(char2)-1, subEquation.indexOf(char2)+2,"$temp");
        }
      }
    }
    else {
      if (subEquation.length > 3) {
        List indeces = digOp(char1, subEquation);
        temp = calculate(subEquation.indexOf(char1), subEquation.substring(indeces[0], indeces[1]));
        subEquation = subEquation.replaceRange(indeces[0],indeces[1],"$temp");
      } else {
        temp = calculate2(subEquation.substring(subEquation.indexOf(char1)-1, subEquation.indexOf(char1)+2));
        subEquation = subEquation.replaceRange(subEquation.indexOf(char1)-1, subEquation.indexOf(char1)+2,"$temp");
      }
    }
  }
  return subEquation;
}
String regex(String string) {
  RegExp re = new RegExp('\\d{0,2}');
  Iterable terms = re.allMatches(string);
  int startIndex = terms.first.start;
  int endIndex = terms.last.end;
  return string.substring(startIndex, endIndex);
}

Iterable regex1(String string) {
  RegExp re = new RegExp('\\d{0,2}');
  Iterable terms = re.allMatches(string);
  return terms;
}