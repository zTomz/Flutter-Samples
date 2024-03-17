import 'dart:io';

import 'package:fast_storage/src/document.dart';
import 'package:path_provider/path_provider.dart';

class FastStorage {
  static Directory location = Directory("");

  FastStorage() {
    init();
  }

  Future<void> init() async {
    location = Directory(
      "${(await getApplicationDocumentsDirectory()).path}/fast_storage/",
    );

    if (!location.existsSync()) {
      await location.create();
    }
  }

  Future<Document> get(String key) async {
    final file = File("${location.path}/$key.fs");

    if (!file.existsSync()) {
      throw DocumentDoesNotExistException();
    }

    return Document.fromText(
      key,
      file.readAsStringSync(),
    );
  }
}

class DocumentDoesNotExistException implements Exception {}
