import 'package:math_engine/src/errors.dart';
import 'package:math_engine/src/lexer/token.dart';

class Lexer {
  static List<Token> tokenize(String input) {
    List<Token> tokens = [];
    List<String> src = input.split('');

    while (src.isNotEmpty) {
      if (_isSkipable(src[0])) {
        src.removeAt(0);
        continue;
      }

      if (src[0] == '+' && src[1] == '-') {
        tokens.add(
          Token(
            value: '-',
            type: TokenType.operator,
          ),
        );
        src.removeAt(0);
        src.removeAt(0);
        continue;
      }

      if (src[0] == '(') {
        tokens.add(
          Token(
            value: src.removeAt(0),
            type: TokenType.openParen,
          ),
        );
      } else if (src[0] == ')') {
        tokens.add(
          Token(
            value: src.removeAt(0),
            type: TokenType.closeParen,
          ),
        );
      } else if (src[0] == '+' ||
          src[0] == '-' ||
          src[0] == '*' ||
          src[0] == '/' ||
          src[0] == '^' ||
          src[0] == '%' ||
          src[0] == 'x' ||
          src[0] == ':') {
        tokens.add(
          Token(
            value: src.removeAt(0),
            type: TokenType.operator,
          ),
        );
      } else {
        // Multiple characters
        if (int.tryParse(src[0]) != null) {
          String number = '';
          String exponent = '';
          bool exponentIsPositive = true;

          while (src.isNotEmpty &&
              (int.tryParse(src[0]) != null ||
                  (src[0] == '.' && !number.contains('.')))) {
            number += src.removeAt(0);
          }

          if (src.length >= 3 && src[0] == 'e') {
            if (src[1] == '+') {
              exponentIsPositive = true;
            } else if (src[1] == '-') {
              exponentIsPositive = false;
            } else {
              throw UnexpectedTokenException(
                'Unexpected token: ${src[1]}, expected + or -',
              );
            }

            // Remove the e and the + or -
            src.removeAt(0);
            src.removeAt(0);

            // Get the exponent
            while (src.isNotEmpty && int.tryParse(src[0]) != null) {
              exponent += src.removeAt(0);
            }
          }

          if (exponent == '') {
            tokens.add(
              Token(
                value: number,
                type: TokenType.number,
              ),
            );
          } else {
            if (exponentIsPositive) {
              tokens.add(
                Token(
                  value: '$number${('0' * int.parse(exponent))}',
                  type: TokenType.number,
                ),
              );
            } else {
              tokens.add(
                Token(
                  value:
                      '0.${'0' * (int.parse(exponent) - 1)}${number.replaceAll('.', '')}',
                  type: TokenType.number,
                ),
              );
            }
          }
        } else {
          tokens.add(
            Token(
              value: src.removeAt(0),
              type: TokenType.unknown,
            ),
          );

          throw UnknownTokenTypeException(
            'Unknown token type: ${tokens.last.value} of type ${tokens.last.type}',
          );
        }
      }
    }

    tokens.add(
      Token(
        value: '',
        type: TokenType.end,
      ),
    );

    return tokens;
  }

  static bool _isSkipable(String c) {
    return c == ' ' || c == '\t' || c == '\n' || c == '\r';
  }
}
