import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monglee/app/config/moglee_color.dart';
import 'package:monglee/app/extensions/styler.dart';
import 'package:monglee/app/routes/app_routes.dart';
import 'package:monglee/app/util/notification_util.dart';
import 'package:monglee/app/util/version_util.dart';
import 'package:monglee/presentation/components/monglee_toast.dart';
import 'package:monglee/presentation/controllers/setting/setting_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashPage();
}

class _SplashPage extends State<SplashPage> {
  final SettingController sController = Get.find();
  final VersionUtil versionUtil = VersionUtil();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
      versionUtil.initAppVersion();
      sController.initSettingData().then((_){
        if(sController.mbti.value != ''){
          Get.toNamed(Routes.HOME);
        }else{
          NotificationUtil.displayNotificationRationale(() {
            Get.toNamed(Routes.MBTI_SETTING);
          }, () {
            MongleeToast.show(context: context, msg: '알림 미동의시 알림이 오지않습니다.');
            Get.toNamed(Routes.MBTI_SETTING);
          });
        }
      });
    });
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
