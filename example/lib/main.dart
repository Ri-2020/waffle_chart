import 'package:flutter/material.dart';
import 'package:waffle_chart/waffle_chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: WaffleChart(
          chartData: WaffleChartData(
            showYearLable: true,
            showEndOfYear: false,
            filledColor: const Color(0xffE76504),
            filledBorderColor: Colors.transparent,
            unfilledColor: const Color(0xffFDE7D5),
            unfilledBorderColor: const Color(0xffFDE7D5),
            year: 2024,
            width: 300,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
            lableChartGap: 16,
            lableStyle: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            dataPoints: [
              DayData(
                isFilled: true,
                date: DateTime(2024, 10, 3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
