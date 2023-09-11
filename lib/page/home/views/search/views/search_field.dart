import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:monglee/util/moglee_color.dart';
import 'package:monglee/util/styler.dart';

class SearchField extends StatefulWidget {
  SearchField({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchField();
}

class _SearchField extends State<SearchField> {
  final TextStyle _searchStyle = Styler.style(fontWeight: FontWeight.w500);
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 48,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.white),
      padding: const EdgeInsets.only(left: 12, top: 12, bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {},
            child: SizedBox(
              width: 24,
              height: 24,
              child: SvgPicture.asset(
                'assets/images/search_icon.svg',
                color: gray200,
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
              child: ValueListenableBuilder<String>(
                  valueListenable: _text,
                  builder: (context, value, child) {
                    return TextFormField(
                      onTap: () {},
                      onChanged: (value) {
                        setState(() {
                          _text.value = value;
                        });
                      },
                      onEditingComplete: () {},
                      onFieldSubmitted: (value) {},
                      textInputAction: TextInputAction.go,
                      controller: controller,
                      style: _searchStyle,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 8),
                          hintText: '할 일 키워드를 검색해보세요!',
                          hintStyle: _hintStyle,
                          suffixIcon: Visibility(
                            visible: value.isNotEmpty,
                            child: GestureDetector(
                              onTap: () {
                                controller.clear();
                                setState(() {
                                  _text.value = '';
                                });
                              },
                              child: SizedBox(
                                width: 24,
                                height: 24,
                                child: SvgPicture.asset(
                                    'assets/images/remove_icon.svg'),
                              ),
                            ),
                          )),
                    );
                  }))
        ],
      ),
    );
  }

  ValueNotifier<String> _text = ValueNotifier('');

  final TextStyle _hintStyle =
      Styler.style(color: gray300, fontWeight: FontWeight.w500);
}
