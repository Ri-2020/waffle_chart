part of 'waffle_chart.dart';

class YearlyChartGrid extends StatelessWidget {
  final WaffleChartData chartData;
  final Widget lableWidget;
  final Function(BuildContext context, DayData data)? dayBuilder;
  const YearlyChartGrid({
    super.key,
    required this.chartData,
    required this.lableWidget,
    this.dayBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: chartData.width ?? 250,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (chartData.isLableAtTop && chartData.showYearLable) lableWidget,
          if (chartData.isLableAtTop && chartData.showYearLable)
            SizedBox(
              height: chartData.lableChartGap ?? 8,
            ),
          Container(
            color: chartData.isDeveloping ? Colors.blue : null,
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  color: chartData.isDeveloping ? Colors.red : null,
                  width: 30,
                  // height: 250,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                      12,
                      (index) => Column(
                        children: [
                          Padding(
                            padding: chartData.sideLalblePadding ??
                                const EdgeInsets.only(
                                    bottom: 6.8), // this is static
                            child: Text(
                              DateFormat("MMM")
                                  .format(DateTime(chartData.year, index + 1)),
                              textScaler: TextScaler.noScaling,
                              style: chartData.lableStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GridView(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: chartData.crossAxisCount ?? 21,
                      crossAxisSpacing: chartData.crossAxisSpacing ?? 2,
                      mainAxisSpacing: chartData.mainAxisSpacing ?? 2,
                    ),
                    children: List<Widget>.from(
                      DayData.getYearData(chartData.dataPoints, chartData.year)
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
                ),
              ],
            ),
          ),

          if (chartData.showEndOfYear)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Divider(
                    height: 1,
                    color: const Color(0xffa2a7af).withOpacity(0.3),
                    // color: Color(0xff46505F).withOpacity(0.5),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    color: Colors.white,
                    child: Text(
                      "END OF YEAR ${chartData.year}",
                      textScaler: TextScaler.noScaling,
                      style: chartData.lableStyle,
                    ),
                  ),
                ],
              ),
            ),

          // if (!chartData.isLableAtTop)
          //   SizedBox(
          //     height: chartData.lableChartGap ?? 8,
          //   ),
          // if (!chartData.isLableAtTop) lableWidget,
        ],
      ),
    );
  }
}
