import 'package:flutter/material.dart';
import 'package:notes/pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          secondary: const Color(0xFF211E1C),
          background: Colors.black,
          brightness: Brightness.dark,
        ),
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
              backgroundColor: const Color(0xFF211E1C),
              foregroundColor: const Color(0xFFFFFFFF),
              iconSize: 45,
              padding: const EdgeInsets.all(16)),
        ),
        textTheme: GoogleFonts.loraTextTheme(
          const TextTheme(
            headlineLarge: TextStyle(
              fontSize: 70,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
