import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monglee/util/moglee_color.dart';
import 'package:monglee/util/styler.dart';
import 'package:monglee/view_layer/component/common_ui.dart';
import 'package:monglee/view_layer/component/monglee_btn.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final CommonUI commonUI = CommonUI();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                commonUI.title(
                    '모두를 위한 일정 관리\n지금 시작해보세요!', '즉흥적인 P 유형부터 꼼꼼한 J 유형까지'),
                Padding(
                  padding: const EdgeInsets.only(bottom: 58),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _hintBubble(),
                      const SizedBox(
                        height: 16,
                      ),
                      _loginItem(LoginType.kakao),
                      const SizedBox(
                        height: 16,
                      ),
                      _loginItem(LoginType.google),
                      const SizedBox(
                        height: 16,
                      ),
                      _loginItem(LoginType.apple)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        onWillPop: () => Future(() => false));
  }

  final TextStyle _bubbleStyle = Styler.style(fontSize: 14, fontWeight: FontWeight.w600);

  Widget _hintBubble() {
    return SizedBox(
      width: 140,
      height: 50,
      child: Stack(
        children: [
          SizedBox(
            width: 140,
            height: 50,
            child: SvgPicture.asset('assets/images/speech_bubble.svg'),
          ),
          Positioned(
              top: 11,
              left: 15,
              right: 10,
              child: Text(
                '3초만에 시작하기 ⚡️',
                style: _bubbleStyle,
              ))
        ],
      ),
    );
  }

  Widget _loginItem(LoginType type) {
    final LoginItemModel item = _whichLoginType(type);
    return MongleeBtn(
      clickFuntion: item.function,
      btnColor: item.color,
      horizontalPadding: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 18,
            height: 18,
            child: SvgPicture.asset(item.logo),
          ),
          const SizedBox(
            width: 12,
          ),
          Text(
            item.title,
            style: type == LoginType.apple ? _appleLoginStyle : _loginStyle,
          )
        ],
      ),
    );
  }

  final TextStyle _loginStyle = Styler.style(
      color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16);
  final TextStyle _appleLoginStyle = Styler.style(
      color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16);

  LoginItemModel _whichLoginType(LoginType type) {
    switch (type) {
      case LoginType.google:
        return LoginItemModel(
            title: '구글로 로그인',
            logo: 'assets/images/${type.name}.svg',
            function: () {},
            color: Colors.white);
      case LoginType.apple:
        return LoginItemModel(
            title: '애플로 로그인',
            logo: 'assets/images/${type.name}.svg',
            function: () {},
            color: Colors.black);
      case LoginType.kakao:
        return LoginItemModel(
            title: '카카오로 로그인',
            logo: 'assets/images/${type.name}.svg',
            function: () {},
            color: turbo);
    }
  }
}

enum LoginType { google, apple, kakao }

class LoginItemModel {
  final String title;
  final String logo;
  final Function() function;
  final Color color;

  LoginItemModel(
      {required this.title,
      required this.logo,
      required this.function,
      required this.color});
}
