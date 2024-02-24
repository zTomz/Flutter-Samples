class Token {
  final String content;
  final TokenType type;

  Token({
    required this.content,
    required this.type,
  });
}

enum TokenType {
  number,
  operator,
  openParen,
  closeParen,
  unknown,
}
