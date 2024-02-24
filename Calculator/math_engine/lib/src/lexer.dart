import 'package:math_engine/src/token.dart';

class Lexer {
  static List<Token> tokenize(String input) {
    List<Token> tokens = [];
    List<String> src = input.split('');

    while (src.isNotEmpty) {
      if (_isSkipable(src[0])) {
        src.removeAt(0);
        continue;
      }

      if (src[0] == '(') {
        tokens.add(
          Token(
            content: src.removeAt(0),
            type: TokenType.openParen,
          ),
        );
      } else if (src[0] == ')') {
        tokens.add(
          Token(
            content: src.removeAt(0),
            type: TokenType.closeParen,
          ),
        );
      } else if (src[0] == '+' ||
          src[0] == '-' ||
          src[0] == '*' ||
          src[0] == '/' ||
          src[0] == '^' ||
          src[0] == '%') {
        tokens.add(
          Token(
            content: src.removeAt(0),
            type: TokenType.operator,
          ),
        );
      } else {
        // Multiple characters
        if (int.tryParse(src[0]) != null) {
          String number = '';
          while (src.isNotEmpty &&
              (int.tryParse(src[0]) != null ||
                  (src[0] == '.' && !number.contains('.')))) {
            number += src.removeAt(0);
          }
          tokens.add(
            Token(
              content: number,
              type: TokenType.number,
            ),
          );
        } else {
          tokens.add(
            Token(
              content: src.removeAt(0),
              type: TokenType.unknown,
            ),
          );
        }
      }
    }

    tokens.add(
      Token(
        content: '',
        type: TokenType.end,
      ),
    );

    return tokens;
  }

  static bool _isSkipable(String c) {
    return c == ' ' || c == '\t' || c == '\n' || c == '\r';
  }
}
