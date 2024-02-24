import 'package:math_engine/math_engine.dart';
import 'package:math_engine/src/parser/parser.dart';

void main() {
  final input = '(1 + 2) * 3';
  final tokens = Lexer.tokenize(input);
  final calculation = Parser().produceAST(tokens);
  print(calculation);
}
