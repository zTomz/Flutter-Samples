import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: 200,
          height: 100,
          margin: const EdgeInsets.only(bottom: 40),
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
                  onPressed: () {},
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
        ),
      ),
      extendBody: true,
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top),
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
                  icon: PhosphorIcon(
                    PhosphorIcons.squaresFour(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.green,
            ),
          ),
          Container(
            color: Colors.orange,
            height: 100,
          ),
        ],
      ),
    );
  }
}
