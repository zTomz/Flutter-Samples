import 'package:math_engine/src/parser/node_type.dart';
import 'package:math_engine/src/parser/operator.dart';

abstract class Statement {
  final NodeType type;

  Statement({
    required this.type,
  });
}

class Calculation extends Statement {
  final List<Statement> statements;

  Calculation({
    required this.statements,
  }) : super(type: NodeType.calculation);

  @override
  String toString() {
    return 'Calculation(statements: $statements, type: $type)';
  }
}

class Expression extends Statement {
  final Statement left;
  final Statement right;
  final Operator operator;

  Expression({
    required this.left,
    required this.right,
    required this.operator,
  }) : super(type: NodeType.expression);

  @override
  String toString() {
    return 'Expression(left: $left, right: $right, operator: $operator, type: $type)';
  }
}

class Number extends Statement {
  final num value;

  Number({
    required this.value,
  }) : super(type: NodeType.number);

  @override
  String toString() {
    return 'Number(value: $value, type: $type)';
  }
}
