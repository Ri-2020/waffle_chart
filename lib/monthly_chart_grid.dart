part of 'waffle_chart.dart';

class MonthlyChartGrid extends StatelessWidget {
  final WaffleChartData chartData;
  final Widget lableWidget;
  final Function(BuildContext context, DayData data)? dayBuilder;
  const MonthlyChartGrid(
      {super.key,
      required this.chartData,
      required this.lableWidget,
      this.dayBuilder});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: chartData.width ?? 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (chartData.isLableAtTop) lableWidget,
          if (chartData.isLableAtTop)
            SizedBox(
              height: chartData.lableChartGap ?? 8,
            ),
          GridView(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              crossAxisSpacing: chartData.crossAxisSpacing ?? 2,
              mainAxisSpacing: chartData.mainAxisSpacing ?? 2,
            ),
            children: List<Widget>.from(
              DayData.getMonthData(
                      chartData.dataPoints, chartData.month!, chartData.year,
                      shouldAddFillers: true)
                  .map(
                (e) => dayBuilder != null
                    ? dayBuilder!(context, e)
                    : SingleDayWidget(
                        dayData: e,
                        chartData: chartData,
                      ),
              ),
            ),
          ),
          if (!chartData.isLableAtTop)
            SizedBox(
              height: chartData.lableChartGap ?? 8,
            ),
          if (!chartData.isLableAtTop) lableWidget,
        ],
      ),
    );
  }
}
