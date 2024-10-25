<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

An easy-to-use Flutter package for creating visually engaging streak charts and customizable waffle charts. Designed for simplicity and flexibility, it allows developers to quickly integrate these data visualizations into their apps, helping to track progress, display patterns, or visualize proportions with minimal effort.

## Features

Here’s a refined version of the features:

- **Month Chart**: Effortlessly create sleek, month-based streak charts to visualize daily progress across a single month.
- **Year Chart**: Generate comprehensive yearly streak charts, perfect for tracking long-term trends and patterns over the course of an entire year.
- **Minimal Data Input**: Simply pass only the filled data points, and the package will handle the rest, making chart creation quick and efficient.

## Getting started

To start using the package, follow these steps:

1. **Install the package**: Add the package to your `pubspec.yaml` file.

```yaml
dependencies:
  streak_waffle_chart: latest_version
```

1. **Import the package**: import package in the file you want to use waffle chart.

```dart
import 'package:streak_waffle_chart/streak_waffle_chart.dart';
```

## Usage

**For a Year Chart use the following code**

```dart
    WaffleChart(
        chartData: WaffleChartData(
            showYearLable: true,
            showEndOfYear: false,
            filledColor: Color(0xffE76504),
            filledBorderColor: Colors.transparent,
            unfilledColor: Color(0xffFDE7D5),
            unfilledBorderColor: Color(0xffFDE7D5),
            year: 2024,
            width: 300,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
            lableChartGap: 16,
            lableStyle: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: Colors.black,
            ),
            dataPoints: e,
        ),
    ),

```

**For a Month Chart use the following code**

```dart
    WaffleChart(
        chartData: WaffleChartData(
            showMonthLable: true,
            showFullMonthName: true,
            showYearLable: true,
            filledColor: Color(0xffE76504),
            filledBorderColor: Colors.transparent,
            unfilledColor: Color(0xffFDE7D5),
            unfilledBorderColor: Color(0xffFDE7D5),
            isLableAtTop: true,
            year: 2024,
            month: 10,
            width: 100,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
            lableStyle: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: Colors.black,
            ),
            dataPoints: e,
        ),
    ),

```

## Additional information

For more details on the package, check out the following resources:

Documentation: [Repository] (https://github.com/Ri-2020/waffle_chart.git)
Contributing: Contributions are welcome!
Issues: If you find a bug or have a feature request, please file an issue at GitHub Issues. We’ll aim to respond promptly.
