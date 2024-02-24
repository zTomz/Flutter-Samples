import 'package:math_engine/src/lexer/token.dart';
import 'package:math_engine/src/parser/ast.dart';
import 'package:math_engine/src/parser/operator.dart';

class Parser {
  List<Token> tokens = [];

  Calculation produceAST(List<Token> input) {
    tokens = input;
    Calculation calculation = Calculation(
      statements: [],
    );

    while (tokens[0].type != TokenType.end) {
      calculation.statements.add(
        _parseAdditiveExpression(),
      );
    }

    return calculation;
  }

  Statement _parseAdditiveExpression() {
    Statement left = _parseMultiplicativeExpression();

    while (_notAtEnd() && tokens[0].value == '+' || tokens[0].value == '-') {
      final operator =
          tokens.removeAt(0).value == '+' ? Operator.plus : Operator.minus;

      final right = _parseMultiplicativeExpression();

      left = Expression(
        left: left,
        right: right,
        operator: operator,
      );
    }

    return left;
  }

  Statement _parseMultiplicativeExpression() {
    Statement left = _parsePrimaryExpression();

    while (_notAtEnd() && tokens[0].value == '*' ||
        tokens[0].value == '/' ||
        tokens[0].value == '%' ||
        tokens[0].value == '^') {
      final operator = tokens.removeAt(0).value == '*'
          ? Operator.multiply
          : tokens.removeAt(0).value == '/'
              ? Operator.divide
              : tokens.removeAt(0).value == '%'
                  ? Operator.mod
                  : Operator.power;

      final right = _parsePrimaryExpression();

      left = Expression(
        left: left,
        right: right,
        operator: operator,
      );
    }

    return left;
  }

  Statement _parsePrimaryExpression() {
    switch (tokens[0].type) {
      case TokenType.number:
        return Number(value: double.parse(tokens.removeAt(0).value));
      case TokenType.openParen:
        // Remove the '(' open paren -> parse expression -> remove ')' close paren
        tokens.removeAt(0);
        final expression = _parseAdditiveExpression();
        _expect(TokenType.closeParen);
        return expression;
      default:
        throw "Unexpected token ${tokens[0].value} of type ${tokens[0].type}";
    }
  }

  bool _notAtEnd() {
    return tokens[0].type != TokenType.end;
  }

  Token _expect(TokenType type) {
    if (_notAtEnd() && tokens[0].type == type) {
      return tokens.removeAt(0);
    } else {
      throw "Expected ${type.toString()} but got ${tokens[0].value} of type ${tokens[0].type}";
    }
  }
}
