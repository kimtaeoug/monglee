enum TodoRepeat {
  noRepeat('noRepeat', '반복 안 함'),
  eveyDay('everyDay', '매일'),
  eveyMonday('everyMonday', '매주 월요일'),
  weekDay('weekDay', '주중 매일(월~금)'),
  firstMondayOfEveryMonth('fMoEM', '매월 첫 번째 월요일');

  final String code;
  final String contents;

  const TodoRepeat(this.code, this.contents);

  factory TodoRepeat.getByCode(String code) =>
      TodoRepeat.values.where((element) => element.code == code).first;
}

extension TodoRepeatUtil on TodoRepeat{
  List<TodoRepeat> getAll() => TodoRepeat.values.toList();
}
