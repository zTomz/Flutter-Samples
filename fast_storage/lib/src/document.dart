class Document {
  final String key;
  final List<Field> fields;

  Document({
    required this.key,
    required this.fields,
  });

  Document.fromText(String key, String text)
      : this(
          key: key,
          fields: _parseText(text),
        );

  static List<Field> _parseText(String text) {
    return [];
  }
}

abstract class Field<T> extends FieldFactory {
  final String key;
  T value;

  Field({
    required this.key,
    required this.value,
  });

  /// Serializes the field into a string.
  String serialize();
}

abstract class FieldFactory {
  Field<T> deserialize<T>(String text);
}

class TextField extends Field<String> {
  TextField({
    required super.key,
    required super.value,
  });

  @override
  String serialize() {
    return "$key=$value";
  }

  @override
  Field<String> deserialize(String text) {
    return TextField(
      key: key,
      value: text.split("=")[1],
    )
  }
}
