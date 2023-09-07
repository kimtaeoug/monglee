import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart' as t;
import 'package:monglee/util/moglee_color.dart';
import 'package:monglee/util/styler.dart';

class MongleeTimeInput extends StatefulWidget {
  final bool isStart;

  MongleeTimeInput({Key? key, this.isStart = true}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MongleeTimeInput();
}

class _MongleeTimeInput extends State<MongleeTimeInput> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  t.Time _time = t.Time(hour: 11, minute: 30, second: 20);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(t.showPicker(
              value: _time,
              onChange: (value) {},
              onCancel: () {
                Get.back();
              },
              cancelText: '취소',
              okText: '확인'));
        },
        child: SizedBox(
          width: (Get.width - 72) / 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.isStart ? '시작 시간' : '종료 시간',
                style: _labelStyle,
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                  width: (Get.width - 72) / 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '14:22',
                        style: _timeStyle,
                      ),
                      Text(
                        'PM',
                        style: _timeStyle,
                      )
                    ],
                  )),
              const SizedBox(
                height: 12,
              ),
              Container(
                width: Get.width,
                height: 0.5,
                color: gray200,
              )
            ],
          ),
        ));
  }

  final TextStyle _labelStyle =
      Styler.style(color: dustyGray, fontWeight: FontWeight.w500);
  final TextStyle _timeStyle =
      Styler.style(fontSize: 16, fontWeight: FontWeight.w600);
}
