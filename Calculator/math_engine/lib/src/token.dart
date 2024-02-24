class Token {
  final String content;
  final TokenType type;

  Token({
    required this.content,
    required this.type,
  });

  @override
  String toString() {
    return 'Token(content: $content, type: $type)';
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
