import 'package:math_expressions/math_expressions.dart';

class evaluat{
    String EvaluateExpression(String expression) {
  try {

    expression = expression.replaceAll("÷", "/").replaceAll("_", "-");

    Parser p = Parser();
    Expression exp = p.parse(expression);

    ContextModel cm = ContextModel();
    double result = exp.evaluate(EvaluationType.REAL, cm);

    return result.toString();
  } catch (e) {
    return "Error";
  }
}}