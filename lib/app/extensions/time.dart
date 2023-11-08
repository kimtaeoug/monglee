import 'package:easy_localization/easy_localization.dart';

extension Time on DateTime {
  ///
  /// Covnert date to Year Month
  ///
  static String convertToYearMonth(DateTime input) =>
      DateFormat('yyyy년 MM월').format(input);

  ///
  /// is AM or PM
  ///
  static bool isAMorPM(int hour) => hour <= 12;

  static String convertToEFormat(DateTime input) =>
      '${DateFormat('MM월 dd일').format(input)} ${DateFormat('E', 'ko_KR').format(input)}요일';

  static DateTime refineDate(DateTime input) => DateTime(input.year, input.month, input.day, 0, 0);
}
