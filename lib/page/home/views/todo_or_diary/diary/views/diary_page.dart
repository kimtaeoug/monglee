import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:monglee/page/home/views/todo_or_diary/diary/views/diary_common.dart';
import 'package:monglee/util/moglee_color.dart';
import 'package:monglee/util/styler.dart';

class DiaryPage extends StatefulWidget {
  DiaryPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DiaryPage();
}

class _DiaryPage extends State<DiaryPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final TextStyle _style = Styler.style(color: gray400, height: 1.5);
  final DiaryCommon diaryCommon = DiaryCommon();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SizedBox(
      width: Get.width,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            diaryCommon.diaryImg(
                'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https://blog.kakaocdn.net/dn/btBe5w/btrbrTRrocO/K5zpt1sCfur14tKF1lVUYk/img.jpg'),
            const SizedBox(
              height: 16,
            ),
            Padding(padding: const  EdgeInsets.symmetric(horizontal: 24), child: Text(
              _dummyText,
              style: _style,
              maxLines: null,
            ),)
          ],
        ),
      ),
    ));
  }

  final String _dummyText = '''
  국무회의는 대통령·국무총리와 15인 이상 30인 이하의 국무위원으로 구성한다. 선거와 국민투표의 공정한 관리 및 정당에 관한 사무를 처리하기 위하여 선거관리위원회를 둔다.
국가는 농업 및 어업을 보호·육성하기 위하여 농·어촌종합개발과 그 지원등 필요한 계획을 수립·시행하여야 한다. 대법원과 각급법원의 조직은 법률로 정한다.
  ''';
}
