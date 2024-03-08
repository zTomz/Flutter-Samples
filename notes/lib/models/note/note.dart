import 'dart:math';

import 'package:flutter/material.dart';
import 'package:notes/models/colors.dart';
import 'package:uuid/uuid.dart';

class Note {
  final String title;
  final String text;
  final DateTime lastUpdated;
  final Color color;
  final NoteRadiuses radiuses;
  final String uuid;

  Note({
    required this.title,
    required this.text,
    required this.lastUpdated,
    required this.color,
    required this.radiuses,
    required this.uuid,
  });

  Note.fromTitleAndText({String title = "", String text = ""})
      : this(
          title: title,
          text: text,
          lastUpdated: DateTime.now(),
          color: cardColors[Random().nextInt(cardColors.length)],
          radiuses: (
            Random().nextDouble() * 60,
            Random().nextDouble() * 60,
            Random().nextDouble() * 60,
            Random().nextDouble() * 60,
          ),
          uuid: const Uuid().v4(),
        );

  BoxDecoration get decoration => BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radiuses.$1),
          topRight: Radius.circular(radiuses.$2),
          bottomLeft: Radius.circular(radiuses.$3),
          bottomRight: Radius.circular(radiuses.$4),
        ),
      );
}

typedef NoteRadiuses = (double, double, double, double);
