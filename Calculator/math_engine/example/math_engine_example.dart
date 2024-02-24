import 'package:math_engine/math_engine.dart';

void main() {
  final input = '(1 + 2) * 3';
  final tokens = Lexer.tokenize(input);
  print(tokens);
}
