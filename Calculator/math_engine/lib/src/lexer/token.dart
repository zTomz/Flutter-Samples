class Token {
  final String value;
  final TokenType type;

  Token({
    required this.value,
    required this.type,
  });

  @override
  String toString() {
    return 'Token(value: $value, type: $type)';
  }
}

enum TokenType {
  number,
  operator,
  openParen,
  closeParen,
  unknown,
  end,
}

class UnexpectedTokenException implements Exception {
  final String message;

  UnexpectedTokenException(this.message);

  @override
  String toString() {
    return message;
  }
}

class UnknownTokenTypeException implements Exception {
  final String message;

  UnknownTokenTypeException(this.message);

  @override
  String toString() {
    return message;
  }
}

class WrongTokenTypeException implements Exception {
  final String message;

  WrongTokenTypeException(this.message);

  @override
  String toString() {
    return message;
  }
}
