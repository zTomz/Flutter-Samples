import 'package:math_engine/math_engine.dart';
import 'package:test/test.dart';

void main() {
  group('Calculator', () {
    test('2 + 2', () {
      expect(Calculator.calculate('2 + 2'), 4.0);
    });

    test('5 ^ 2 + 2 * 5 + ( 8 - 2 )', () {
      expect(Calculator.calculate('5 ^ 2 + 2 * 5 + ( 8 - 2 )'), 41.0);
    });

    test('254 / 52 - 255 + ( 22 * 552 )', () {
      expect(Calculator.calculate('254 / 52 - 255 + ( 22 * 552 )'),
          11893.884615384615);
    });

    test('2 * 2 + 2 ^ 5', () {
      expect(Calculator.calculate('2 * 2 + 2 ^ 5'), 36.0);
    });
  });
}
