import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monglee/app/config/moglee_color.dart';
import 'package:monglee/app/extensions/styler.dart';
import 'package:monglee/app/routes/app_routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashPage();
}

class _SplashPage extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Get.toNamed(Routes.HOME);
      // Get.toNamed(Routes.LOGIN);
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final TextStyle _titleStyle = Styler.style(
      fontWeight: FontWeight.w700,
      fontSize: 48,
      color: Colors.white,
      fontType: FontType.uhbeeem);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 72,
              height: 72,
              child: Image.asset('assets/images/cotton_3.png'),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              '몽글이',
              style: _titleStyle,
            )
          ],
        ),
      ),
    );
  }
}
