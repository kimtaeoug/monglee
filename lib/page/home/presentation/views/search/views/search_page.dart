import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monglee/component/common_ui.dart';
import 'package:monglee/page/home/presentation/views/search/domain/entity/search_item_model.dart';
import 'package:monglee/page/home/presentation/views/search/views/search_common.dart';
import 'package:monglee/page/home/presentation/views/search/views/search_field.dart';
import 'package:monglee/page/home/presentation/views/todo_or_diary/todo/domain/entity/todo_model.dart';
import 'package:monglee/util/mbti_util.dart';
import 'package:monglee/util/moglee_color.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {
  final SearchCommon searchCommon = SearchCommon();
  final CommonUI commonUI = CommonUI();
  List<String> _mbtiList = MBTIUtil.mbtiList;

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
            child: SearchField(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
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
                                _mbtiList[index], primaryColor),
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
    SearchItemModel(
        imgUrl:
            'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https://blog.kakaocdn.net/dn/btBe5w/btrbrTRrocO/K5zpt1sCfur14tKF1lVUYk/img.jpg',
        nickName: 'UserName',
        mbti: 'intj',
        todoList: [
          TodoModel(
              dateTime: null,
              title: '공복 유산소2',
              contents: '런닝머신 30분 + 싸이클 50분',
              startTime: '07:00',
              endTime: '08:00',
              location: '헬스장'),
          TodoModel(
              dateTime: null,
              title: 'Product Team Meeting',
              contents: 'A 프로젝트 관련 데이터 논의'),
          TodoModel(
              dateTime: null,
              title: 'Product Team Meeting',
              startTime: '07:00',
              endTime: '08:00'),
        ]),
    SearchItemModel(
        imgUrl:
            'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https://blog.kakaocdn.net/dn/btBe5w/btrbrTRrocO/K5zpt1sCfur14tKF1lVUYk/img.jpg',
        nickName: 'UserName2',
        mbti: 'infp',
        todoList: [
          TodoModel(
              dateTime: null,
              title: '공복 유산소2',
              contents: '런닝머신 30분 + 싸이클 50분',
              startTime: '07:00',
              endTime: '08:00',
              location: '헬스장'),
          TodoModel(
              dateTime: null,
              title: '공복 유산소2',
              contents: '런닝머신 30분 + 싸이클 50분',
              startTime: '07:00',
              endTime: '08:00',
              location: '헬스장'),
        ]),
    SearchItemModel(
        imgUrl:
            'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https://blog.kakaocdn.net/dn/btBe5w/btrbrTRrocO/K5zpt1sCfur14tKF1lVUYk/img.jpg',
        nickName: 'UserName3',
        mbti: 'infp',
        todoList: [
          TodoModel(
              dateTime: null,
              title: '공복 유산소2',
              contents: '런닝머신 30분 + 싸이클 50분',
              startTime: '07:00',
              endTime: '08:00',
              location: '헬스장'),
          TodoModel(
              dateTime: null,
              title: 'Product Team Meeting',
              contents: 'A 프로젝트 관련 데이터 논의'),
          TodoModel(
              dateTime: null,
              title: 'Product Team Meeting',
              startTime: '07:00',
              endTime: '08:00'),
          TodoModel(
              dateTime: null,
              title: '공복 유산소2',
              contents: '런닝머신 30분 + 싸이클 50분',
              startTime: '07:00',
              endTime: '08:00',
              location: '헬스장'),
          TodoModel(
              dateTime: null,
              title: '공복 유산소2',
              contents: '런닝머신 30분 + 싸이클 50분',
              startTime: '07:00',
              endTime: '08:00',
              location: '헬스장'),
        ]),
  ];
}
