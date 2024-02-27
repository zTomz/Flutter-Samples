import 'package:flutter/material.dart';
import 'package:math_engine/math_engine.dart';

class CalculationProvider extends ChangeNotifier {
  String _calculation = "";
  String get calculation => _calculation;

  String _result = "";
  String get result => _result;

  List<String> _lastAppendedStrings = [];

  void addToCalculation(String text) {
    // If the result is not empty, set the calculation to the result and clear the result
    if (_result.isNotEmpty) {
      if (_result == "NaN") {
        _calculation = "";
        _lastAppendedStrings.clear();
      } else {
        _calculation = _result;
        _lastAppendedStrings = [_result];
      }
      _result = "";
    }

    _calculation += text;
    _lastAppendedStrings.add(text);

    notifyListeners();
  }

  void resetCalculation() {
    _calculation = "";
    _lastAppendedStrings.clear();
    _result = "";

    notifyListeners();
  }

  void removeLastAppended() {
    // If nothing was appended, do nothing
    if (_lastAppendedStrings.isEmpty) return;

    _calculation = _calculation.substring(
      0,
      _calculation.length - _lastAppendedStrings.removeLast().length,
    );

    notifyListeners();
  }

  void calculate() {
    try {
      _result = Calculator.calculate(_calculation).toString();
    } catch (e) {
      _result = "NaN";
    }

    notifyListeners();
  }
}
