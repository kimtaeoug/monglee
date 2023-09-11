import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:monglee/util/moglee_color.dart';
import 'package:monglee/util/styler.dart';

class SearchField extends StatefulWidget implements PreferredSizeWidget {
  SearchField({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchField();

  @override
  Size get preferredSize => AppBar().preferredSize;
}

class _SearchField extends State<SearchField> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final TextStyle _searchStyle = Styler.style(fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 24, left: 24, right: 24),
      child: Container(
        width: Get.width,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Colors.white),
        padding: const EdgeInsets.only(left: 12, top: 12, bottom: 12),
        child: TextFormField(
          onTap: () {},
          onChanged: (value) {},
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
              hintText: '할 일 키워드를 검색해보세요!',
              hintStyle: _hintStyle,
              prefix: GestureDetector(
                onTap: () {},
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: SvgPicture.asset('assets/images/search_icon.svg'),
                ),
              ),
              suffix: Visibility(
                visible: true,
                child: GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: SvgPicture.asset('assets/images/remove_icon.svg'),
                  ),
                ),
              )),
        ),
      ),
    );
  }

  final TextStyle _hintStyle =
      Styler.style(color: gray300, fontWeight: FontWeight.w500);
}
