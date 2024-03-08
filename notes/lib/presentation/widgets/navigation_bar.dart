import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:notes/presentation/pages/new_note_page.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class NotesNavigationBar extends StatelessWidget {
  const NotesNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.175),
        borderRadius: BorderRadius.circular(180),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 9, sigmaY: 9),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const NewNotePage(),
                  ),
                );
              },
              style: IconButton.styleFrom(
                backgroundColor: Colors.black,
                fixedSize: const Size(90, 90),
              ),
              icon: PhosphorIcon(
                PhosphorIcons.plus(),
              ),
            ),
            IconButton(
              onPressed: () {},
              style: IconButton.styleFrom(
                backgroundColor: Colors.white.withOpacity(0.25),
                fixedSize: const Size(90, 90),
              ),
              icon: PhosphorIcon(
                PhosphorIcons.microphone(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
