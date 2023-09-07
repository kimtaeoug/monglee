import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

  @override
  Widget build(BuildContext context) {
    return TableCalendarBase(firstDay: now, lastDay: now, focusedDay: now, dayBuilder: (context, day, day2){return Container(child: Text(day.toString()),);}, rowHeight: 32, dowVisible: false,);
    // return TableCalendar(
    //     focusedDay: now,
    //     firstDay: DateTime(now.year - 1),
    //     lastDay: DateTime(now.year + 1),
    //     calendarFormat: CalendarFormat.week,
    //     headerStyle: HeaderStyle(
    //       rightChevronIcon: Expanded(
    //         child: Container(
    //           color: Colors.black,
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             mainAxisSize: MainAxisSize.max,
    //             children: [
    //               SizedBox(
    //                 width: 24,
    //                 height: 24,
    //                 child:
    //                     SvgPicture.asset('assets/images/caret_down_icon.svg'),
    //               ),
    //               SizedBox(
    //                 width: 24,
    //                 height: 24,
    //                 child: SvgPicture.asset('assets/images/calendar_icon.svg'),
    //               )
    //             ],
    //           ),
    //         ),
    //       ),
    //       formatButtonVisible: false,
    //       rightChevronPadding: const EdgeInsets.only(right: 24),
    //       rightChevronMargin: EdgeInsets.zero,
    //       headerMargin: EdgeInsets.zero,
    //       headerPadding: EdgeInsets.only(top: AppBar().preferredSize.height),
    //       leftChevronVisible: false,
    //       // titleCentered: true
    //     ),
    //     calendarBuilders: CalendarBuilders(
    //       dowBuilder: (context, day){
    //         switch(day.weekday){
    //           case 1:
    //             return _dayItem('월');
    //           case 2:
    //             return _dayItem('화');
    //           case 3:
    //             return _dayItem('수');
    //           case 4:
    //             return _dayItem('목');
    //           case 5:
    //             return _dayItem('금');
    //           case 6:
    //             return _dayItem('토');
    //           case 7:
    //             return _dayItem('일');
    //         }
    //       }
    //     ),
    //   daysOfWeekHeight: 32,
    //   startingDayOfWeek: StartingDayOfWeek.monday,
    // );
  }
  Widget _dayItem(String text){
    return Center(
      child: Text(text),
    );
  }
}