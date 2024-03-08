import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notes/models/note/note.dart';
import 'package:notes/presentation/widgets/navigation_bar.dart';
import 'package:notes/provider/notes_provider.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final notesProvider = context.watch<NotesProvider>();

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "My\nNotes",
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      IconButton.filledTonal(
                        onPressed: () {},
                        style: IconButton.styleFrom(
                          padding: const EdgeInsets.all(24),
                        ),
                        icon: PhosphorIcon(
                          PhosphorIcons.squaresFour(),
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ),
                StaggeredGrid.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  children: buildTiles(context, notesProvider.notes),
                ),
              ],
            ),
          ),
          const Positioned(
            bottom: 32,
            child: NotesNavigationBar(),
          ),
        ],
      ),
    );
  }

  List<StaggeredGridTile> buildTiles(BuildContext context, List<Note> notes) {
    List<StaggeredGridTile> tiles = [];

    for (int i = 0; i < notes.length; i++) {
      final currentNote = notes[i];
      final markdownTheme = Theme.of(context).textTheme.apply(
            fontSizeFactor: 1.5,
            bodyColor: currentNote.color.computeLuminance() < 0.4
                ? Colors.white
                : Colors.black,
            displayColor: currentNote.color.computeLuminance() < 0.4
                ? Colors.white
                : Colors.black,
          );

      final widget = Container(
        padding: const EdgeInsets.all(26),
        margin: const EdgeInsets.all(8),
        decoration: currentNote.decoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              currentNote.title,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: currentNote.color.computeLuminance() < 0.4
                        ? Colors.white
                        : Colors.black,
                  ),
            ),
            Expanded(
              child: Markdown(
                selectable: true,
                padding: const EdgeInsets.all(4),
                physics: const NeverScrollableScrollPhysics(),
                styleSheet: MarkdownStyleSheet.fromTheme(
                  Theme.of(context).copyWith(
                    textTheme: markdownTheme,
                  ),
                ),
                data: currentNote.text,
              ),
            ),
          ],
        ),
      );

      if ((i + 1) % 3 == 0) {
        tiles.add(
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: widget,
          ),
        );
      } else {
        tiles.add(
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1.75,
            child: widget,
          ),
        );
      }
    }

    return tiles;
  }
}
