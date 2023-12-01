enum MBTIType{
  istj,
  istp,
  infj,
  intj,
  isfj,
  isfp,
  infp,
  intp,
  estj,
  esfp,
  enfp,
  entp,
  esfj,
  estp,
  enfj,
  entj
}
extension MBTIUtil on MBTIType{
  static List<String> mbtilList() =>
      MBTIType.values.map((e) => e.name).toList();

  static String getMBTIItem(String mbti, {int? idx}) {
    if (mbti == '' || mbti.length != 4) {
      return 'ENTP'.split('')[idx ?? 0];
    } else {
      return mbti.split('')[idx ?? 0];
    }
  }
  static String getMBTIByIdx(int idx){
    switch(idx){
      case 0:
        return 'istj';
      case 1:
        return 'istp';
      case 2:
        return 'infj';
      case 3:
        return 'intj';
      case 4:
        return 'isfj';
      case 5:
        return 'isfp';
      case 6:
        return 'infp';
      case 7:
        return 'intp';
      case 8:
        return 'estj';
      case 9:
        return 'enfp';
      case 10:
        return 'enfp';
      case 11:
        return 'entp';
      case 12:
        return 'esfj';
      case 13:
        return 'estp';
      case 14:
        return 'enfj';
      case 15:
        return 'entj';
      default:
        return 'infj';
    }
  }
}