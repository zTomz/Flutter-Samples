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
