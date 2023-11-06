import 'package:flutter/cupertino.dart';
import 'package:monglee/util/moglee_color.dart';

class MBTIUtil {
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

  static String getMBTIItem(String mbti, {int? idx}) {
    if (mbti == '' || mbti.length != 4) {
      return 'ENTP'.split('')[idx ?? 0];
    } else {
      return mbti.split('')[idx ?? 0];
    }
  }

  static Color mbtiColor(String mbti) {
    switch (mbti.toLowerCase()) {
      case 'infj':
        return infjColor;
      case 'entj':
        return entjColor;
      case 'entp':
        return entpColor;
      case 'intj':
        return intjColor;
      case 'infp':
        return infpColor;
      case 'enfj':
        return enfjColor;
      case 'enfp':
        return enfpColor;
      case 'istj':
        return istjColor;
      case 'isfj':
        return isfjColor;
      case 'estj':
        return estjColor;
      case 'esfj':
        return esfjColor;
      case 'istp':
        return istpColor;
      case 'isfp':
        return isfpColor;
      case 'estp':
        return estpColor;
      case 'esfp':
        return esfpColor;
      default:
        return primaryColor;
    }
  }
}
