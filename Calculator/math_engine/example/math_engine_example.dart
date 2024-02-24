import 'package:math_engine/src/calculator/calculator.dart';

void main() {
  final input = '5 ^ 2 + 2 * 5 + ( 8 - 2 )';
  final calculation = Calculator.calculate(input);

  print(calculation); // Prints 41.0
}
