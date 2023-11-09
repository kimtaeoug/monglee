///
/// hap - 행복, bri - 기쁨, cal - 평온, dep - 우울, ang - 화남, sad - 슬픔
///
enum EmotionType {
  hap(0, 2, '행복'),
  bri(1, 3, '기쁨'),
  cal(2, 1, '평온'),
  dep(3, 3, '우울'),
  ang(4, 1, '화남'),
  sad(5, 4, '슬픔');

  final int code;
  final int assetNumber;
  final String state;

  const EmotionType(this.code, this.assetNumber, this.state);
}

extension EmotionUtil on EmotionType {
  static String getData(int input, {bool state = true}) {
    switch (input) {
      case 0:
        return state
            ? EmotionType.hap.state
            : EmotionType.hap.assetNumber.toString();
      case 1:
        return state
            ? EmotionType.bri.state
            : EmotionType.bri.assetNumber.toString();
      case 2:
        return state
            ? EmotionType.cal.state
            : EmotionType.cal.assetNumber.toString();
      case 3:
        return state
            ? EmotionType.dep.state
            : EmotionType.dep.assetNumber.toString();
      case 4:
        return state
            ? EmotionType.ang.state
            : EmotionType.ang.assetNumber.toString();
      case 5:
        return state
            ? EmotionType.sad.state
            : EmotionType.sad.assetNumber.toString();
      default:
        return EmotionType.hap.state;
    }
  }

  static String? getEmotionByDate(
      DateTime calendarDate, DateTime emotionDate, int emotion) {
    if (DateTime(calendarDate.year, calendarDate.month, calendarDate.day) ==
        DateTime(emotionDate.year, emotionDate.month, emotionDate.day)) {
      return getData(emotion, state: false);
    }
    return null;
  }
}
