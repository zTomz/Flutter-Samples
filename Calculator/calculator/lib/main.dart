import 'package:calculator/calculation_notifier.dart';
import 'package:calculator/calculator_page.dart';
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: false,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
          brightness: Brightness.dark,
          secondary: const Color(0xFF3A4655),
          onSecondary: const Color(0xFF828E95),
          background: const Color(0xFF323C4A),
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.w300,
          ),
        ),
        useMaterial3: true,
      ),
      home: const CalculatorPage(),
    );
  }
}
