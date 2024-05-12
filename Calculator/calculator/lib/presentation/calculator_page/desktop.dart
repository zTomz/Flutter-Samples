import 'package:calculator/presentation/widgets/calculator_button.dart';
import 'package:calculator/provider/calculation_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DesktopCalculatorPage extends StatefulWidget {
  const DesktopCalculatorPage({super.key});

  @override
  State<DesktopCalculatorPage> createState() => _DesktopCalculatorPageState();
}

class _DesktopCalculatorPageState extends State<DesktopCalculatorPage> {
  String calculation = "";
  String result = "";

  List<CalculatorButton> buttons = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    buttons = [
      CalculatorButton.number("7", context),
      CalculatorButton.number("8", context),
      CalculatorButton.number("9", context),
      CalculatorButton.operator("%", context),
      CalculatorButton.operator("/", context),
      CalculatorButton.operator("x", context),
      CalculatorButton.number("^", context),
      CalculatorButton.number("4", context),
      CalculatorButton.number("5", context),
      CalculatorButton.number("6", context),
      CalculatorButton.operator("-", context),
      CalculatorButton.operator("+", context),
      CalculatorButton.equal(context),
      CalculatorButton.number(".", context),
      CalculatorButton.number("1", context),
      CalculatorButton.number("2", context),
      CalculatorButton.number("3", context),
      CalculatorButton.number("0", context),
      CalculatorButton.empty(),
      CalculatorButton.delete(context),
      CalculatorButton.clear(context),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SafeArea(
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 2.5,
              child: Container(
                margin: const EdgeInsets.all(32.0),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(32.0),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 75,
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "History",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          IconButton(
                            onPressed: () {},
                            tooltip: "Clear History",
                            icon: const Icon(Icons.delete_forever_rounded),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(32),
                    color: Theme.of(context).colorScheme.background,
                    alignment: Alignment.centerRight,
                    child: Consumer(
                      builder: (context,
                          CalculationProvider calculationProvider, _) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              calculationProvider.calculation,
                              textAlign: TextAlign.right,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary,
                                    fontSize: 50,
                                  ),
                            ),
                            const SizedBox(height: 10),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                calculationProvider.result.endsWith('.0')
                                    ? calculationProvider.result
                                        .replaceFirst('.0', '')
                                    : calculationProvider.result,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge
                                    ?.copyWith(fontSize: 70),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  height: (MediaQuery.of(context).size.height / 7) * 3,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                    ),
                  ),
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7,
                    ),
                    itemCount: buttons.length,
                    itemBuilder: (BuildContext context, int index) {
                      final calculatorButton = buttons[index];

                      return MaterialButton(
                        onPressed: () => calculatorButton.onPressed(context),
                        padding: EdgeInsets.zero,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).colorScheme.background,
                            ),
                          ),
                          child: Text(
                            calculatorButton.text,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                  color: calculatorButton.color,
                                ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
