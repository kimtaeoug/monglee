enum TodoRepeat {
  noRepeat('n', '반복안함'),
  minute5('5m', '5분마다'),
  minute10('10m', '10분마다'),
  minute30('30m', '30분마다'),
  minute60('60m', '1시간마다');
  // weekdays('wd', '주중 매일(월~금)'),
  // weekends('we', '주말마다'),
  // dailys('dy', '매일');
  // wfMon('wf_mon', '매주 첫 번째 월요일'),
  // mfMon('mf_mon', '매달 첫 번째 월요일');

  final String code;
  final String contents;

  const TodoRepeat(this.code, this.contents);

  factory TodoRepeat.getByCode(String code) =>
      TodoRepeat.values.where((element) => element.code == code).first;
}

extension TodoRepeatUtil on TodoRepeat {
  List<TodoRepeat> getAll() => TodoRepeat.values.toList();

  static String codeOfTodoRepeat(int input) {
    switch (input) {
      case -1:
        return 'n';
      case 0:
        return 'n';
      case 1:
        return '5m';
      case 2:
        return '10m';
      case 3:
        return '30m';
      case 4:
        return '60m';
    // case 4:
      //   return 'wf_mon';
      // case 5:
      //   return 'mf_mon';
      default:
        return 'n';
    }
  }
}
