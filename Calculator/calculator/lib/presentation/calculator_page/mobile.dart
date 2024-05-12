import 'package:calculator/presentation/widgets/calculator_button.dart';
import 'package:calculator/provider/calculation_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MobileCalculatorPage extends StatefulWidget {
  const MobileCalculatorPage({super.key});

  @override
  State<MobileCalculatorPage> createState() => _MobileCalculatorPageState();
}

class _MobileCalculatorPageState extends State<MobileCalculatorPage> {
  String calculation = "";
  String result = "";

  List<CalculatorButton> buttons = [];

  late PageController pageController;
  int currentPage = 1;

  GlobalKey stackKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    pageController = PageController(initialPage: currentPage);
  }

  @override
  void dispose() {
    pageController.dispose();

    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    buttons = [
      CalculatorButton.clear(context),
      CalculatorButton.delete(context),
      CalculatorButton.operator("%", context),
      CalculatorButton.operator("/", context),
      CalculatorButton.number("7", context),
      CalculatorButton.number("8", context),
      CalculatorButton.number("9", context),
      CalculatorButton.operator("x", context),
      CalculatorButton.number("4", context),
      CalculatorButton.number("5", context),
      CalculatorButton.number("6", context),
      CalculatorButton.operator("-", context),
      CalculatorButton.number("1", context),
      CalculatorButton.number("2", context),
      CalculatorButton.number("3", context),
      CalculatorButton.operator("+", context),
      CalculatorButton.number(".", context),
      CalculatorButton.number("0", context),
      CalculatorButton.number("^", context),
      CalculatorButton.equal(context),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) => Stack(
                key: stackKey,
                alignment: Alignment.center,
                children: [
                  PageView(
                    controller: pageController,
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                    children: [
                      Container(
                        padding: const EdgeInsets.all(32),
                        color: Theme.of(context).colorScheme.background,
                        alignment: Alignment.centerRight,
                      ),
                      Container(
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
                                      ),
                                ),
                                const SizedBox(height: 10),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Text(
                                    calculationProvider.result.isEmpty
                                        ? calculationProvider.preCalculate()
                                        : calculationProvider.result,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  AnimatedPositioned(
                    left: currentPage == 0 ? mediaQuery.size.width - 15 : 10,
                    duration: const Duration(milliseconds: 300),
                    child: Container(
                      width: 5,
                      height: 35,
                      margin: const EdgeInsets.only(top: 17.75),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(90),
                      ),
                    ),
                  ),

                  /// This widget represents the app bar
                  Positioned(
                    top: 0,
                    child: AnimatedContainer(
                      width: mediaQuery.size.width,
                      height:
                          currentPage == 0 ? mediaQuery.padding.top + 60 : 0,
                      padding: EdgeInsets.only(top: mediaQuery.padding.top),
                      duration: const Duration(milliseconds: 300),
                      color: Theme.of(context).colorScheme.secondary,
                      child: currentPage == 0
                          ? Row(
                              children: [
                                BackButton(
                                  onPressed: () {
                                    pageController.jumpToPage(1);
                                  },
                                ),
                                Text(
                                  "History",
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                              ],
                            )
                          : null,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: (mediaQuery.size.width / 4) * 5,
            color: Theme.of(context).colorScheme.secondary,
            child: GridView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemCount: buttons.length,
              itemBuilder: (BuildContext context, int index) {
                final calculatorButton = buttons[index];

                return MaterialButton(
                  onPressed: () {
                    if (currentPage != 1) {
                      pageController.jumpToPage(1);
                    }

                    calculatorButton.onPressed(context);
                  },
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
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
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
    );
  }
}
