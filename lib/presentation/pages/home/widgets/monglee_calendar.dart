import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:monglee/app/config/moglee_color.dart';
import 'package:monglee/app/extensions/emotion.dart';
import 'package:monglee/app/extensions/styler.dart';
import 'package:monglee/app/extensions/time.dart';
import 'package:table_calendar/table_calendar.dart';

class MongleeCaneldar extends StatelessWidget {
  final DateTime date;
  final Function(DateTime, DateTime) selectedFunction;
  final Function(DateTime) pageChangedFunction;
  final bool calendarType;
  final Function() calendarTypeFunction;
  final Map<DateTime, int> emotionMap;

  MongleeCaneldar(
      {Key? key,
      required this.date,
      required this.selectedFunction,
      required this.pageChangedFunction,
      required this.calendarType,
      required this.calendarTypeFunction,
      required this.emotionMap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: AppBar().preferredSize.height),
      child: SizedBox(
        width: Get.width,
        child: TableCalendar(
            headerStyle: const HeaderStyle(
                rightChevronVisible: false,
                leftChevronVisible: false,
                formatButtonVisible: false),
            // headerVisible: false,
            focusedDay: date,
            currentDay: date,
            firstDay: DateTime(date.year - 1),
            lastDay: DateTime(date.year + 1),
            calendarFormat: calendarType == true
                ? CalendarFormat.month
                : CalendarFormat.week,
            calendarBuilders: _calendarBuilders(),
            startingDayOfWeek: StartingDayOfWeek.monday,
            availableGestures: AvailableGestures.horizontalSwipe,
            onDaySelected: selectedFunction),
      ),
    );
  }

  final TextStyle _headTextStyle =
      Styler.style(fontWeight: FontWeight.w600, fontSize: 24);

  Widget _dayItem(String text) {
    return Center(
      child: Text(
        text,
        style: _dowStyle,
      ),
    );
  }

  final TextStyle _dowStyle = Styler.style(color: gray300, fontSize: 14);
  final TextStyle _defaultStyle =
      Styler.style(color: gray300, fontSize: 16, fontWeight: FontWeight.w600);
  final TextStyle _selectedDateStyle =
      Styler.style(color: mintBg, fontWeight: FontWeight.w800, fontSize: 16);

  CalendarBuilders _calendarBuilders() =>
      CalendarBuilders(dowBuilder: (context, day) {
        switch (day.weekday) {
          case 1:
            return _dayItem('월');
          case 2:
            return _dayItem('화');
          case 3:
            return _dayItem('수');
          case 4:
            return _dayItem('목');
          case 5:
            return _dayItem('금');
          case 6:
            return _dayItem('토');
          case 7:
            return _dayItem('일');
        }
        return null;
      }, defaultBuilder: (context, date, date2) {
        return _emotionWidget(date);
      }, todayBuilder: (context, date, date2) {
        return _emotionWidget(date, isSelected: true);
      }, selectedBuilder: (context, date, date2) {
        return Center(
          child: Text(
            date.day.toString(),
            style: _selectedDateStyle,
          ),
        );
      }, headerTitleBuilder: (context, date) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 24, left: 24, right: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Time.convertToYearMonth(date),
                style: _headTextStyle,
              ),
              GestureDetector(
                onTap: () => calendarTypeFunction.call(),
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: SvgPicture.asset(
                      'assets/images/calendar${calendarType == true ? '_month' : ''}_icon.svg'),
                ),
              )
            ],
          ),
        );
      });

  Widget _emotionWidget(DateTime date, {bool isSelected = false}) {
    DateTime d = DateTime(date.year, date.month, date.day);
    if (emotionMap.containsKey(DateTime(date.year, date.month, date.day))) {
      return Center(
        child: SizedBox(
          width: 24,
          height: 24,
          child: Image.asset(
              'assets/images/cotton_${EmotionUtil.getData(emotionMap[d] ?? 1, state: false)}.png'),
        ),
      );
    } else {
      return Center(
        child: Text(
          date.day.toString(),
          style: !isSelected ? _defaultStyle : _selectedDateStyle,
        ),
      );
    }
  }
}
