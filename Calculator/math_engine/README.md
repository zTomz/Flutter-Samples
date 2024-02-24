# Math Engine

This is the math engine for the calculator. I wrote this package for fun, you also just can go to pub.dev and use a package from there. This package does not support every feature, but it has everything needed for the calculator.

## Features

- Calculate basic math operations.

## Getting started

1. Add the package to your `pubspec.yaml` file.
```yaml
dependencies:
    math_engine: 
        path: ../math_engine/
```
2. Import the package
```dart
import 'package:math_engine/math_engine.dart';
```
3. Use the package
- See [Usage](#usage)


## Usage

```dart
final input = '5 * (1 + 2) * 3';
final num result = Calculator.calculate(input);
```

## Additional information

I wrote this package just for fun and it is not published on pub.dev. I only use it for the calculator project.
