import 'dart:ui';

const Color primaryColor = Color(0xff8FBEB4);
const Color mineShatf = Color(0xff242424);
const Color gray = Color(0xff838383);
const Color black = Color(0xff2F2F2F);
const Color dustyGray = Color(0xff959595);
const Color turbo = Color(0xffFEE500);
const Color lightCoral = Color(0xffEE8492);
const Color gallery = Color(0xffF0F0F0);

const Color gray500 = Color(0xffDFDFDF);
const Color gray400 = Color(0xff959595);
const Color gray300 = Color(0xffBCBCBC);
const Color gray200 = Color(0xffD1D1D1);
const Color gray100 = Color(0xffEFEFEF);
const Color gray150 = Color(0xffF9F9F9);

const Color textLightPrimary = Color(0xff16191C);
const Color mintText = Color(0xff66B8A3);
const Color mintBg = Color(0xffA2D6C8);

const Color silver = Color(0xffCCCCCC);
const Color darkGray = Color(0xffAEAEAE);

const Color skeletonBaseColor = Color(0xffF0F0F0);
const Color skeletonHighLightColor = Color(0xffE1E1E1);
///
/// MBTI Color
///
const Color intjColor = Color(0xffEE8492);
const Color entjColor = Color(0xffF2BCC2);
const Color entpColor = Color(0xffFCB984);
const Color infjColor = Color(0xffE5DA6E);
const Color infpColor = Color(0xff77A4E7);
const Color enfjColor = Color(0xff82C6E3);
const Color enfpColor = Color(0xffA2AAF9);
const Color istjColor = Color(0xffC1BDDD);
const Color isfjColor = Color(0xffA3D6A2);
const Color estjColor = Color(0xffE0E091);
const Color esfjColor = Color(0xffCBCBCB);
const Color istpColor = Color(0xff9B61D4);
const Color isfpColor = Color(0xffEE8484);
const Color estpColor = Color(0xffACD46B);
const Color esfpColor = Color(0xff7E4F34);

Color mbtiColor(String mbti) {
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
