import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart' as t;
import 'package:monglee/app/config/moglee_color.dart';
import 'package:monglee/app/extensions/time.dart';

import '../../app/extensions/styler.dart';

class MongleeTimeInput extends StatefulWidget {
  final bool isStart;
  final Function(t.Time)? selectedTimeFunction;

  MongleeTimeInput({Key? key, this.isStart = true, this.selectedTimeFunction})
      : super(key: key);

  @override
  State<MongleeTimeInput> createState() => _MongleeTimeInput();
}

class _MongleeTimeInput extends State<MongleeTimeInput> {
  t.Time _time = t.Time(hour: 11, minute: 30, second: 20);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(t.showPicker(
              value: _time,
              onChange: (value) {
                if (widget.selectedTimeFunction != null) {
                  widget.selectedTimeFunction?.call(value);
                  if (mounted) {
                    setState(() {
                      _time = value;
                    });
                  }
                }
              },
              accentColor: primaryColor,
              unselectedColor: gray200,
              is24HrFormat: true,
              onCancel: () {
                Get.back();
              },
              cancelText: '취소',
              okText: '확인',
              iosStylePicker: true,
              hourLabel: '시',
              minuteLabel: '분',
              height: 350,
              elevation: 0,
              borderRadius: 26,
              okStyle: Styler.style(
                  color: primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontType: FontType.uhbeeem),
              cancelStyle: Styler.style(
                  color: gray200,
                  fontSize: 20,
                  fontType: FontType.uhbeeem,
                  fontWeight: FontWeight.w700)));
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
                        '${_time.hour}:${_time.minute}',
                        style: _timeStyle,
                      ),
                      Text(
                        Time.isAMorPM(_time.hour) ? 'AM' : 'PM',
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
