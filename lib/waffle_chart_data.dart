part of 'waffle_chart.dart';

class WaffleChartData {
  /// Jaunary is 1
  ///
  /// [Null] for yearly chart
  final int? month;
  final int year;
  late int? daysInMonth;
  final bool showEndOfYear;
  final bool showMonthLable;
  final bool showYearLable;
  final Color filledColor;
  final Color unfilledColor;
  late Color filledBorderColor;
  late Color unfilledBorderColor;
  final double? width;
  final double? mainAxisSpacing;
  final double? crossAxisSpacing;

  /// only for year chart
  final int? crossAxisCount;

  /// only for year chart
  final EdgeInsetsGeometry? sideLalblePadding;

  /// This field is only applicable for monthly chart
  final bool isLableAtTop;
  final double? lableChartGap;
  final TextStyle lableStyle;
  final bool showFullMonthName;

  /// all data points should be of same month
  final List<DayData> dataPoints;

  final bool isDeveloping;

  int getDaysInMonth(int year, int month) {
    // If the month is December, we move to the next year, January
    if (month == 12) {
      return DateTime(year, month, 31).day;
    } else {
      // Create a DateTime object for the first day of the next month, then subtract one day
      DateTime firstDayNextMonth = DateTime(year, month + 1, 1);
      DateTime lastDayThisMonth =
          firstDayNextMonth.subtract(const Duration(days: 1));
      return lastDayThisMonth.day;
    }
  }

  WaffleChartData({
    this.isDeveloping = false,
    this.month,
    this.crossAxisCount,
    this.sideLalblePadding,
    this.showEndOfYear = false,
    required this.year,
    this.isLableAtTop = false,
    required this.dataPoints,
    this.lableChartGap,
    this.filledColor = Colors.green,
    Color? filledBorderColor,
    this.unfilledColor = Colors.transparent,
    Color? unfilledBorderColor,
    this.showMonthLable = false,
    this.showYearLable = false,
    this.width,
    this.mainAxisSpacing,
    this.crossAxisSpacing,
    this.lableStyle = const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    this.showFullMonthName = false,
  }) {
    if (month != null) {
      daysInMonth = getDaysInMonth(year, month!);
    }
    this.filledBorderColor = filledBorderColor ?? Colors.green.withOpacity(0.4);
    this.unfilledBorderColor =
        unfilledBorderColor ?? Colors.black.withOpacity(0.2);
  }
}

class DayData<T> {
  /// this date will be marked
  final bool isFilled;

  /// in case of monthly chart the week days which are not present in the month will be skipped
  ///
  /// for Expampl
  ///
  /// if a month starts from Wednesday then 2 days Monday and Tesday will not be shown as boxes
  final bool isFiller;

  /// [value] can be used in case of [dayBuilder] default [dayBuilder] do not use [value]
  final T? value;

  /// the date of the block which you want to edit
  final DateTime date;

  ///[waffle_chart.DayData.DayData] is the constructor
  DayData({
    required this.isFilled,
    this.isFiller = false,
    this.value,
    required this.date,
  });

  /// [waffle_chart.DayData.getMonthData] & [waffle_chart.DayData.getYearData] are the internal function need not to use by the end user

  static List<DayData> getMonthData(
    List<DayData> dataList,
    int month,
    int year, {
    bool shouldAddFillers = false,
  }) {
    // Create a map of existing day data for quick lookup
    Map<int, DayData> filledDaysMap = {
      for (var entry in dataList)
        if (entry.date.year == year && entry.date.month == month)
          entry.date.day: entry
    };

    // Determine how many days are in the given month and year
    int daysInMonth = DateTime(year, month + 1, 0).day;

    List<DayData> result = [];

    // Calculate the weekday the month starts on (Monday is 1, Sunday is 7)
    int startWeekday = DateTime(year, month, 1).weekday;

    // Add fillers if required
    if (shouldAddFillers) {
      for (int i = 1; i < startWeekday; i++) {
        result.add(DayData(
          isFilled: false,
          value: null,
          date: DateTime(year, month, 1)
              .subtract(Duration(days: startWeekday - i)),
          isFiller: true, // Mark as filler
        ));
      }
    }

    // Iterate over all days in the given month
    for (int day = 1; day <= daysInMonth; day++) {
      if (filledDaysMap.containsKey(day)) {
        // If the day exists in the input data, add it
        result.add(filledDaysMap[day]!);
      } else {
        // If the day is missing in the input data, create an unfilled entry
        result.add(DayData(
          isFilled: false,
          value: null,
          date: DateTime(year, month, day),
        ));
      }
    }

    return result;
  }

  static List<DayData> getYearData(List<DayData> dataList, int year) {
    // Create a map of existing day data for quick lookup
    Map<int, DayData> filledDaysMap = {
      for (var entry in dataList)
        if (entry.date.year == year)
          entry.date.month * 100 + entry.date.day: entry
    };

    List<DayData> result = [];

    // Iterate over all months (1 to 12) of the year
    for (int month = 1; month <= 12; month++) {
      // Determine how many days are in the current month
      int daysInMonth = DateTime(year, month + 1, 0).day;

      // Iterate over all days in the current month
      for (int day = 1; day <= daysInMonth; day++) {
        // Calculate a unique key for the day (month * 100 + day) for quick lookup
        int dayKey = month * 100 + day;

        if (filledDaysMap.containsKey(dayKey)) {
          // If the day exists in the input data, add it
          result.add(filledDaysMap[dayKey]!);
        } else {
          // If the day is missing in the input data, create an unfilled entry
          result.add(DayData(
            isFilled: false,
            value: null,
            date: DateTime(year, month, day),
          ));
        }
      }
    }

    return result;
  }
}
