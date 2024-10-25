library waffle_chart;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

part "./waffle_chart_data.dart";
part "./single_day_widget.dart";
part "./monthly_chart_grid.dart";
part "./yearly_chart_grid.dart";

/// [waffle_chart] is the parent widget to be used
///
/// [waffle_chart.DayData] is use to provide the data points for the chart

class WaffleChart extends StatelessWidget {
  final WaffleChartData chartData;
  final Function(
    BuildContext context,
    DayData dayData,
  )? dayBuilder;
  const WaffleChart({
    super.key,
    required this.chartData,
    this.dayBuilder,
  });

  Widget lableWidget() {
    return !(chartData.showMonthLable || chartData.showYearLable)
        ? const SizedBox.shrink()
        : Text(
            "${chartData.showMonthLable && chartData.month != null ? DateFormat(chartData.showFullMonthName ? "MMMM" : "MMM").format(DateTime(chartData.year, chartData.month!)) : ""} ${chartData.showYearLable ? chartData.year : ""}",
            style: chartData.lableStyle,
            textScaler: TextScaler.noScaling,
          );
  }

  @override
  Widget build(BuildContext context) {
    return chartData.month == null
        ? YearlyChartGrid(
            chartData: chartData,
            lableWidget: lableWidget(),
            dayBuilder: dayBuilder,
          )
        : MonthlyChartGrid(
            chartData: chartData,
            lableWidget: lableWidget(),
            dayBuilder: dayBuilder,
          );
  }
}
