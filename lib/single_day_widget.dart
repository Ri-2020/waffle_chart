part of 'waffle_chart.dart';

class SingleDayWidget extends StatelessWidget {
  final DayData dayData;
  final WaffleChartData chartData;
  const SingleDayWidget(
      {super.key, required this.dayData, required this.chartData});

  @override
  Widget build(BuildContext context) {
    if (dayData.isFiller) {
      return const SizedBox(
        width: 10,
        height: 10,
      );
    }

    if (dayData.date.isAfter(DateTime.now())) {
      return Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xfff1f1f1)),
          borderRadius: BorderRadius.circular(1),
        ),
      );
    }
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color:
            dayData.isFilled ? chartData.filledColor : chartData.unfilledColor,
        border: Border.all(
          color: dayData.isFilled
              ? chartData.filledBorderColor
              : chartData.unfilledBorderColor,
        ),
        borderRadius: BorderRadius.circular(1),
      ),
    );
  }
}
