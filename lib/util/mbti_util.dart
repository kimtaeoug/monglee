class MBTIUtil{
  static final List<String> mbtiList = [
    'istj',
    'isfj',
    'infj',
    'intj',
    'istp',
    'infp',
    'intp',
    'estp',
    'esfp',
    'enfp',
    'entp',
    'estj',
    'esfj',
    'enfj',
    'entj'
  ];
  static String getMBTIItem(String mbti, {int? idx}){
    if(mbti == '' || mbti.length != 4){
      return 'ENTP'.split('')[idx ?? 0];
    }else{
      return mbti.split('')[idx ?? 0];
    }
  }
}