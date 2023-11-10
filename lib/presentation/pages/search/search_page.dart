import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monglee/app/config/moglee_color.dart';
import 'package:monglee/app/extensions/mbti.dart';
import 'package:monglee/data/models/search_item_model.dart';
import 'package:monglee/data/models/todo_model.dart';
import 'package:monglee/presentation/components/common_ui.dart';
import 'package:monglee/presentation/pages/search/widgets/search_common.dart';
import 'package:monglee/presentation/pages/search/widgets/search_field.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {
  final SearchCommon searchCommon = SearchCommon();
  final CommonUI commonUI = CommonUI();
  final List<String> _mbtiList = MBTIUtil.mbtilList();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: gray150,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: AppBar().preferredSize.height),
            child: const SearchField(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: SizedBox(
              width: Get.width,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(
                      _mbtiList.length,
                      (index) => Padding(
                            padding: EdgeInsets.only(
                                left: index == 0 ? 24 : 8,
                                right: index == _mbtiList.length - 1 ? 24 : 0),
                            child: commonUI.mbtiChip(
                                _mbtiList[index], mbtiColor(_mbtiList[index])),
                          )),
                ),
              ),
            ),
          ),
          Expanded(
              child: SizedBox(
            width: Get.width,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(
                    _dummyList.length,
                    (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: searchCommon.searchItem(
                              _dummyList[index].imgUrl,
                              _dummyList[index].nickName,
                              _dummyList[index].mbti,
                              _dummyList[index].todoList),
                        )),
              ),
            ),
          ))
        ],
      ),
    );
  }

  final List<SearchItemModel> _dummyList = [
    const SearchItemModel(
        imgUrl:
            'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https://blog.kakaocdn.net/dn/btBe5w/btrbrTRrocO/K5zpt1sCfur14tKF1lVUYk/img.jpg',
        nickName: 'UserName',
        mbti: 'intj',
        todoList: [
          TodoModel(
              dateTime: null,
              title: '공복 유산소2',
              contents: '런닝머신 30분 + 싸이클 50분',
              // startTime: '07:00',
              // endTime: '08:00',
              location: '헬스장'),
          TodoModel(
              dateTime: null,
              title: 'Product Team Meeting',
              contents: 'A 프로젝트 관련 데이터 논의'),
          TodoModel(
              dateTime: null,
              title: 'Product Team Meeting',
              // startTime: '07:00',
              // endTime: '08:00'
          ),
        ]),
    const SearchItemModel(
        imgUrl:
            'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https://blog.kakaocdn.net/dn/btBe5w/btrbrTRrocO/K5zpt1sCfur14tKF1lVUYk/img.jpg',
        nickName: 'UserName2',
        mbti: 'infp',
        todoList: [
          TodoModel(
              dateTime: null,
              title: '공복 유산소2',
              contents: '런닝머신 30분 + 싸이클 50분',
              // startTime: '07:00',
              // endTime: '08:00',
              location: '헬스장'),
          TodoModel(
              dateTime: null,
              title: '공복 유산소2',
              contents: '런닝머신 30분 + 싸이클 50분',
              // startTime: '07:00',
              // endTime: '08:00',
              location: '헬스장'),
        ]),
    const SearchItemModel(
        imgUrl:
            'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https://blog.kakaocdn.net/dn/btBe5w/btrbrTRrocO/K5zpt1sCfur14tKF1lVUYk/img.jpg',
        nickName: 'UserName3',
        mbti: 'infp',
        todoList: [
          TodoModel(
              dateTime: null,
              title: '공복 유산소2',
              contents: '런닝머신 30분 + 싸이클 50분',
              // startTime: '07:00',
              // endTime: '08:00',
              location: '헬스장'),
          TodoModel(
              dateTime: null,
              title: 'Product Team Meeting',
              contents: 'A 프로젝트 관련 데이터 논의'),
          TodoModel(
              dateTime: null,
              title: 'Product Team Meeting',
              // startTime: '07:00',
              // endTime: '08:00'
          ),
          TodoModel(
              dateTime: null,
              title: '공복 유산소2',
              contents: '런닝머신 30분 + 싸이클 50분',
              // startTime: '07:00',
              // endTime: '08:00',
              location: '헬스장'),
          TodoModel(
              dateTime: null,
              title: '공복 유산소2',
              contents: '런닝머신 30분 + 싸이클 50분',
              // startTime: '07:00',
              // endTime: '08:00',
              location: '헬스장'),
        ]),
  ];
}
