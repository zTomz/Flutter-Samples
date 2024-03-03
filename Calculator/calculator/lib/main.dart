import 'package:calculator/provider/calculation_notifier.dart';
import 'package:calculator/presentation/responsive_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CalculationProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFC94940),
          secondary: const Color(0xFFE9EDED),
          onSecondary: const Color(0xFFB0BFBF),
          tertiary: const Color(0xFFD2DADA),
          background: const Color(0xFFFFFFFF),
          onBackground: const Color(0xFF141414),
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
          brightness: Brightness.dark,
          secondary: const Color(0xFF323C4A),
          onSecondary: const Color(0xFF828E95),
          tertiary: const Color(0xFF29313D),
          background: const Color(0xFF3A4655),
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      home: const ResponsivePage(),
    );
  }
}
