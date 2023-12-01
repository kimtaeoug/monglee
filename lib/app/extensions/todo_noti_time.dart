enum TodoNotiTime {
  noTime(0, '알림 없음'),
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

  static TodoNotiTime getTimeByIdx(int idx){
    switch(idx){
      case 0:
        return TodoNotiTime.noTime;
      case 1:
        return TodoNotiTime.minutes10Ago;
      case 2:
        return TodoNotiTime.minutes30Ago;
      case 3:
        return TodoNotiTime.minutes60Ago;
      default:
        return TodoNotiTime.noTime;
    }
  }

}
