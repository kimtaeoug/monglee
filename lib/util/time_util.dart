import 'package:easy_localization/easy_localization.dart';

class TimeUtil{
  ///
  /// Covnert date to Year Month
  ///
  static String convertToYearMonth(DateTime input){
    return DateFormat('yyyy년 MM월').format(input);
  }
  ///
  /// is AM or PM
  ///
  static bool isAMorPM(int hour){
    return hour <= 12;
  }
}