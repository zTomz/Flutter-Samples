import 'package:calculator/presentation/calculator_page/desktop.dart';
import 'package:calculator/presentation/calculator_page/mobile.dart';
import 'package:flutter/material.dart';

class ResponsivePage extends StatelessWidget {
  const ResponsivePage({super.key});

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width > 600) {
      return const DesktopCalculatorPage();
    }

    return const MobileCalculatorPage();
  }
}
