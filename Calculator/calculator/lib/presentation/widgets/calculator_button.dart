import 'package:calculator/provider/calculation_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculatorButton {
  final String text;
  final Color color;
  final void Function(BuildContext context) onPressed;

  const CalculatorButton({
    required this.text,
    required this.color,
    required this.onPressed,
  });

  CalculatorButton.number(String number, BuildContext context)
      : this(
          text: number,
          color: Theme.of(context).colorScheme.onBackground,
          onPressed: (context) {
            context.read<CalculationProvider>().addToCalculation(number);
          },
        );

  CalculatorButton.operator(String operator, BuildContext context)
      : this(
          text: operator,
          color: Theme.of(context).colorScheme.onSecondary,
          onPressed: (context) {
            context.read<CalculationProvider>().addToCalculation(
                  // Only append a space, if no space is already at the end
                  '${context.read<CalculationProvider>().calculation.split('').last == ' ' ? '' : ' '}$operator ',
                );
          },
        );

  CalculatorButton.clear(BuildContext context)
      : this(
          text: "C",
          color: Theme.of(context).colorScheme.primary,
          onPressed: (context) {
            context.read<CalculationProvider>().resetCalculation();
          },
        );

  CalculatorButton.delete(BuildContext context)
      : this(
          text: "DEL",
          color: Theme.of(context).colorScheme.onSecondary,
          onPressed: (context) {
            context.read<CalculationProvider>().removeLastAppended();
          },
        );

  CalculatorButton.equal(BuildContext context)
      : this(
          text: "=",
          color: Theme.of(context).colorScheme.onSecondary,
          onPressed: (context) {
            context.read<CalculationProvider>().calculate();
          },
        );

  CalculatorButton.empty()
      : this(
          text: "",
          color: Colors.transparent,
          onPressed: (_) {},
        );
}
