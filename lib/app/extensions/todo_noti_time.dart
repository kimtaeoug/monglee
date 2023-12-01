import 'package:monglee/app/util/monglee_logger.dart';

enum TodoNotiTime {
  noTime(0, '알림 없음'),
  minutes1Ago(1, '1분 전'),
  minutes5Ago(5, '5분 전'),
  minutes10Ago(10, '10분 전'),
  minutes30Ago(30, '30분 전'),
  minutes60Ago(60, '1시간 전');

  final int code;
  final String contents;

  const TodoNotiTime(this.code, this.contents);

  factory TodoNotiTime.getByCode(int code) =>
      TodoNotiTime.values.where((element) => element.code == code).first;
}

extension TodoNotiTimeUtil on TodoNotiTime {
  List<TodoNotiTime> getAll() => TodoNotiTime.values.toList();

  static TodoNotiTime getTimeByCode(int idx) {
    switch (idx) {
      case 0:
        return TodoNotiTime.noTime;
      case 1:
        return TodoNotiTime.minutes1Ago;
      case 5:
        return TodoNotiTime.minutes5Ago;
      case 10:
        return TodoNotiTime.minutes10Ago;
      case 30:
        return TodoNotiTime.minutes30Ago;
      case 60:
        return TodoNotiTime.minutes60Ago;
      default:
        return TodoNotiTime.noTime;
    }
  }

  static List<TodoNotiTime> notiTimeList(int hour, int minute) {
    DateTime now = DateTime.now();
    logger.e('now : $now');
    DateTime refined = DateTime(now.year, now.month, now.day, hour, minute);
    logger.e('refined : $refined');
    Duration difference = refined.difference(now);
    logger.e('difference : $difference');
    if (difference.inMinutes > 60) {
      return [
        TodoNotiTime.noTime,
        TodoNotiTime.minutes1Ago,
        TodoNotiTime.minutes5Ago,
        TodoNotiTime.minutes10Ago,
        TodoNotiTime.minutes30Ago,
        TodoNotiTime.minutes60Ago
      ];
    } else if (difference.inMinutes > 30) {
      return [
        TodoNotiTime.noTime,
        TodoNotiTime.minutes1Ago,
        TodoNotiTime.minutes5Ago,
        TodoNotiTime.minutes10Ago,
        TodoNotiTime.minutes30Ago,
      ];
    } else if (difference.inMinutes > 10) {
      return [
        TodoNotiTime.noTime,
        TodoNotiTime.minutes1Ago,
        TodoNotiTime.minutes5Ago,
        TodoNotiTime.minutes10Ago,
      ];
    } else if (difference.inMinutes > 5) {
      return [
        TodoNotiTime.noTime,
        TodoNotiTime.minutes1Ago,
        TodoNotiTime.minutes5Ago,
      ];
    } else if (difference.inMinutes > 1) {
      return [TodoNotiTime.noTime, TodoNotiTime.minutes1Ago];
    } else {
      return [];
    }
  }
}
