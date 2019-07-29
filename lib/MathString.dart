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
    return calculate(equation);
  }
  //Loop through if the equation does have parentheses adding the calculated
  // values to the values array
  while (equation.contains('(')) {
    //Call the calculate function on the sub equation within the parentheses
    values.add(calculate(equation.substring(equation.indexOf('(')+1, equation.indexOf(')'))));
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