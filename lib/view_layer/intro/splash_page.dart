import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monglee/util/moglee_color.dart';
import 'package:monglee/util/styler.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashPage();
}

class _SplashPage extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) {});
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final TextStyle _titleStyle = Styler.style(
      fontWeight: FontWeight.w700, fontSize: 48, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Text(
          '몽글이',
          style: _titleStyle,
        ),
      ),
    );
  }
}
