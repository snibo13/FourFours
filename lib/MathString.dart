/*
Parse equations is a recursive function
returns an int result of the interior operations
minimizes with substrings going right then left
Order of operations using contains and further reducing for recursive calls
 */
int parseEquation(String eq) {
  eq.replaceAll(' ', ''); //Remove all spaces ONE TIME
  eq.replaceAll('//4', '2'); //Square roots ONE TIME
  int result = 0;
  //If there is grouping symbols evaluate the subset within the symbols
  while (eq.contains('('))  {
    //Store result of inner grouping left as int
    result += parseEquation(eq.substring(eq.indexOf('('),eq.indexOf(')')));
    //Reset bounds
    eq = eq.substring(eq.indexOf(')') + 1);
  }
  //Order of operations

  //TODO: Decide on squared or to the fourth
  //Loop for multiplication and division
  while (eq.contains('x') || eq.contains('/')) {
    double res = 0;
    int multIndex = eq.indexOf('x');
    int divIndex = eq.indexOf('/');
    if (multIndex < divIndex && divIndex != -1) {
      res = eq.substring(multIndex - 1, multIndex) as double;
      res *= eq.substring(multIndex, multIndex + 1) as int;
      eq.replaceAll(eq.substring(multIndex - 1, multIndex + 1), res as String);
    } else if (multIndex != -1){
      double res = 0;
      res = eq.substring(divIndex - 1, divIndex) as double;
      res /= eq.substring(divIndex, divIndex + 1) as int;
      eq.replaceAll(eq.substring(divIndex - 1, divIndex + 1), res as String);
    } else {
      print(eq);
      break;
    }
  }
  while (eq.contains('+') || eq.contains('-')) {
    double res = 0;
    int addIndex = eq.indexOf('+');
    int subIndex = eq.indexOf('-');
    if (addIndex < subIndex && subIndex != -1) {
      res = eq.substring(addIndex - 1, addIndex) as double;
      res += eq.substring(addIndex, addIndex + 1) as int;
      eq.replaceAll(eq.substring(addIndex - 1, addIndex + 1), res as String);
    } else if (addIndex != -1){
      double res = 0;
      res = eq.substring(subIndex - 1, subIndex) as double;
      res -= eq.substring(subIndex, subIndex + 1) as int;
      eq.replaceAll(eq.substring(subIndex - 1, subIndex + 1), res as String);
    } else {
      print(eq);
      break;
    }
  }
  if (int.tryParse(eq) != null) {
    return eq as int;
  }


    return result;
  }