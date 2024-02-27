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
