/*
Created by Sidney Nimako-Boateng
Four Fours App
TODO: Add square root function
 */

/*
Parses a string equation to a numerical value
 */
int parseEquation(String equation) {
  //Stores values in the cases of parentheses
  var values = [];
  //Actual numerical value to be returned
  int val = 0;
  //Efficiency if the equation does not contain any grouping symbols
  if (!equation.contains("(")) {
    return oop(equation);
  }
  //Loop through if the equation does have parentheses adding the calculated
  // values to the values array
  while (equation.contains('(')) {
    //Call the calculate function on the sub equation within the parentheses
    values.add(oop(equation.substring(equation.indexOf('(')+1, equation.indexOf(')'))));
    //Modify the equation to remove the parentheses and their contents
    equation = equation.replaceRange(0, equation.indexOf(')')+1," ");
  }
  //If their is an operation to be done outside of the parentheses
  if(!(equation.substring(0,1) is num)) {
    //Calculate the value of the integers within the values array
    for (int i = 0; i < values.length; i++) {
      val += values[i];
    }
    //Return the value of the new equation re-calling parseEquation
    return parseEquation("$val" + equation);
  } else {
    //If there is no other operations to be done sum the values and return
    for (int i = 0; i < values.length; i++) {
      val += values[i];
    }
    return val;
  }

}
/*
  Calculates the value of an equation
  param: equation to be calculated
 */
int calculate(String subEquation) {
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

int oop(String subEquation) {
  var values = [];
  int val = 0;
  while (subEquation.contains('\u221a')) {
    subEquation = subEquation.replaceRange(subEquation.indexOf('\u221a'), subEquation.indexOf('\u221a')+2,"2");
  }
  while(subEquation.contains("\u00F7") || subEquation.contains("x")) {
    //Contains Multiplication
    if (subEquation.contains("x")) {
      //Both signs
      if (subEquation.contains("\u00F7")) {
        //Multiplication before division
        if(subEquation.indexOf("x") < subEquation.indexOf("\u00F7")) {
          int temp = calculate(subEquation.substring(subEquation.indexOf("x")-1, subEquation.indexOf("x")+2));
          subEquation = subEquation.replaceRange(subEquation.indexOf("x")-1, subEquation.indexOf("x")+2,"$temp");
        }
        //Division before Multiplication
        else {
          int temp = calculate(subEquation.substring(subEquation.indexOf("\u00F7")-1, subEquation.indexOf("\u00F7")+2));
          subEquation = subEquation.replaceRange(subEquation.indexOf("\u00F7")-1, subEquation.indexOf("\u00F7")+2, "$temp");
        }
      }
      //Only multiplication
      else {
        int temp = calculate(subEquation.substring(subEquation.indexOf("x")-1, subEquation.indexOf("x")+2));
        subEquation = subEquation.replaceRange(subEquation.indexOf("x")-1, subEquation.indexOf("x")+2,"$temp");
      }
    }
    //Only has division
    else {
      int temp = calculate(subEquation.substring(subEquation.indexOf("\u00F7")-1, subEquation.indexOf("\u00F7")+2));
      subEquation = subEquation.replaceRange(subEquation.indexOf("\u00F7")-1, subEquation.indexOf("\u00F7")+2,"$temp");
    }
  }
  while(subEquation.contains("-") || subEquation.contains("+")) {
    //Contains addition
    if (subEquation.contains("+")) {
      //Both signs
      if (subEquation.contains("-")) {
        //Addition before subtraction
        if(subEquation.indexOf("+") < subEquation.indexOf("-")) {
          int temp = calculate(subEquation.substring(subEquation.indexOf("+")-1, subEquation.indexOf("+")+2));
          subEquation = subEquation.replaceRange(subEquation.indexOf("+")-1, subEquation.indexOf("+")+2,"$temp");
        }
        //Subtraction before addition
        else {
          int temp = calculate(subEquation.substring(subEquation.indexOf("-")-1, subEquation.indexOf("-")+2));
          subEquation = subEquation.replaceRange(subEquation.indexOf("-")-1, subEquation.indexOf("-")+2, "$temp");
        }
      }
      //Only addition
      else {
        int temp = calculate(subEquation.substring(subEquation.indexOf("+")-1, subEquation.indexOf("+")+2));
        subEquation = subEquation.replaceRange(subEquation.indexOf("+")-1, subEquation.indexOf("+")+2,"$temp");
      }
    }
    //Only has subtraction
    else {
      int temp = calculate(subEquation.substring(subEquation.indexOf("-")-1, subEquation.indexOf("-")+2));
      subEquation = subEquation.replaceRange(subEquation.indexOf("-")-1, subEquation.indexOf("-")+2,"$temp");
    }
  }
  return int.parse(subEquation);
}