import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:monglee/util/moglee_color.dart';
import 'package:monglee/util/styler.dart';
import 'package:monglee/util/time_util.dart';
import 'package:table_calendar/table_calendar.dart';

class MongleeCaneldar extends StatefulWidget {
  MongleeCaneldar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MongleeCaneldar();
}

class _MongleeCaneldar extends State<MongleeCaneldar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final DateTime now = DateTime.now();

  final Logger logger = Logger(printer: PrettyPrinter());
  DateTime _pageStandardTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: AppBar().preferredSize.height),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        TimeUtil.convertToYearMonth(_pageStandardTime),
                        style: _headTextStyle,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: SvgPicture.asset(
                          'assets/images/caret_down_icon.svg',
                          colorFilter: const ColorFilter.mode(mineShatf, BlendMode.srcIn),
                        ),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child:
                      SvgPicture.asset('assets/images/calendar_icon.svg'),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          SizedBox(
            width: Get.width,
            height: 75,
            child: TableCalendar(
              headerVisible: false,
              focusedDay: now,
              firstDay: DateTime(now.year - 1),
              lastDay: DateTime(now.year + 1),
              calendarFormat: CalendarFormat.week,
              calendarBuilders: _calendarBuilders(),
              startingDayOfWeek: StartingDayOfWeek.monday,
              onPageChanged: (date) {
                if (mounted) {
                  setState(() {
                    _pageStandardTime = date;
                  });
                }
              },
            ),
          )
        ],
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
      }, defaultBuilder: (context, date, date2) {
        return Center(
          child: Text(
            date.day.toString(),
            style: _defaultStyle,
          ),
        );
      }, todayBuilder: (context, date, date2) {
        return Center(
          child: Text(
            date.day.toString(),
            style: _selectedDateStyle,
          ),
        );
      });
}
