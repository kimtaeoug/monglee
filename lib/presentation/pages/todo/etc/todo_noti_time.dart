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

extension TodoNotiTimeUtil on TodoNotiTime{
  List<TodoNotiTime> getAll() => TodoNotiTime.values.toList();
}