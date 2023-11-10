enum MBTIType{
  istj, isfj, infj, intj, istp, infp, intp, estp, esfp, entp, estj, esfj, enfj, entj
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
}