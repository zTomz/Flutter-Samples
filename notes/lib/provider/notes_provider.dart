import 'package:flutter/material.dart';
import 'package:notes/models/note/note.dart';

class NotesProvider extends ChangeNotifier {
  NotesProvider({bool debug = false}) {
    if (debug) {
      _notes = [
        Note.fromTitleAndText(
          title: "Test",
          text: "This is an example note. It is only for demo.",
        ),
        Note.fromTitleAndText(
          title: "This is a long title",
          text: """
### This is a heading

##### This is a sub heading

- This is a bullet point
  - This is another bullet point
- [x] I'm *CheckBox*
""",
        ),
        Note.fromTitleAndText(
          title: "Grocery List",
          text: """
    * Milk
    * Eggs
    * Bread
    * Bananas
    * Apples
    [ ] Cheese (maybe?)
    """,
        ),
        Note.fromTitleAndText(
          title: "Random Idea",
          text: """
    I had an idea for a new app that lets users track their daily walks and compete with friends for the most steps. Maybe integrate it with a charity donation system somehow... 
    """,
        ),
        Note.fromTitleAndText(
          title: "Meeting Notes - March 7th",
          text: """
- Project deadline pushed back to end of month due to unforeseen delays.
- John will update the team on the new requirements by Monday.
- Need to finalize design mockups by Wednesday for client presentation.
    """,
        ),
        Note.fromTitleAndText(
          title: "Book Review",
          text: """
Just finished reading "The Hitchhiker's Guide to the Galaxy" by Douglas Adams. Hilarious and insightful! Definitely recommend it for some sci-fi comedy. 
    """,
        ),
      ];
    }
  }

  List<Note> _notes = [];
  List<Note> get notes => _notes;

  void addNote(Note note) {
    _notes.add(note);

    notifyListeners();
  }

  void removeNote(Note note) {
    _notes.removeWhere(
      (element) => element == note,
    );

    notifyListeners();
  }
}
