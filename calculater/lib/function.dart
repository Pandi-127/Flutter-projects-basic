import 'package:flutter/cupertino.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:untitled/evaluvatexpression.dart';

class Myfunction {
  static String res = "";
  static bool lastWasOperator = false;
  static bool lastWasDot = false;
  static bool lastWasDotmid = false;
  static bool  lastWasnumm =true;
  static final eve =evaluat();

  static String appendInput(String s, Function setState) {
    var Digits = ["7", "8", "9", "4", "5", "6", "1", "2", "3", "0"];
    var butoperators = ["÷", "*", "+", "-", "_"];

    setState(() {
      switch (s) {
        case "AC":
          res = "";
          lastWasOperator = false;
          break;

        case "⌫":
          if (res.isNotEmpty) {
            String removed = res[res.length - 1];
            res = res.substring(0, res.length - 1);

            // if we removed an operator, allow operators again
            if (butoperators.contains(removed)) {
              lastWasOperator = false;
            }
          }
          break;

        default:
          if (Digits.contains(s)) {
            res += s;
            lastWasOperator = false;
            if(lastWasDotmid){
              lastWasDot=false;
              lastWasDotmid =false;
              lastWasnumm = true;

            }

          } else if (butoperators.contains(s)) {
            if (!lastWasOperator && res.isNotEmpty) {
              res += s;

              lastWasOperator = true;
              lastWasDot = true;
              lastWasDotmid = true;

            }
          } else if (s == "."&&!lastWasDot) {
            if(res.isNotEmpty){
            res += s;
            lastWasOperator = false;
            lastWasDot=true; }
            else if(res.isEmpty){
              res ="0.";
              lastWasDot =true;
            }
          } else if (s == "=") {
            res = eve.EvaluateExpression(res);
          }
          break;
      }
    });

    return res;
  }
}
