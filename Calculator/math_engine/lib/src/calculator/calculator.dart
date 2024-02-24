import 'dart:math';

import 'package:math_engine/src/lexer/lexer.dart';
import 'package:math_engine/src/lexer/token.dart';
import 'package:math_engine/src/parser/ast.dart';
import 'package:math_engine/src/parser/node_type.dart';
import 'package:math_engine/src/parser/operator.dart';
import 'package:math_engine/src/parser/parser.dart';

class Calculator {
  /// Calculate the given input and return the result as a number
  static num calculate(String input) {
    // Tokenize the input
    List<Token> tokens = Lexer.tokenize(input);

    // Parse the tokens
    Calculation calculation = Parser().produceAST(tokens);

    // Evaluate the calculation
    return _evaluate(calculation);
  }

  static num _evaluate(Statement statement) {
    switch (statement.type) {
      case NodeType.calculation:
        return _evaluateCalculation(statement as Calculation);
      case NodeType.expression:
        return _evaluateExpression(statement as Expression);
      case NodeType.number:
        return (statement as Number).value;
    }
  }

  static num _evaluateCalculation(Calculation calculation) {
    num result = 0;

    for (Statement statement in calculation.statements) {
      result += _evaluate(statement);
    }

    return result;
  }

  static num _evaluateExpression(Expression expression) {
    switch (expression.operator) {
      case Operator.plus:
        return _evaluate(expression.left) + _evaluate(expression.right);
      case Operator.minus:
        return _evaluate(expression.left) - _evaluate(expression.right);
      case Operator.multiply:
        return _evaluate(expression.left) * _evaluate(expression.right);
      case Operator.divide:
        return _evaluate(expression.left) / _evaluate(expression.right);
      case Operator.power:
        return pow(_evaluate(expression.left), _evaluate(expression.right));
      case Operator.mod:
        return _evaluate(expression.left) % _evaluate(expression.right);
    }
  }
}
