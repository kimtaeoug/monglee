import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monglee/app/config/moglee_color.dart';
import 'package:monglee/app/extensions/styler.dart';

class MongleeBottomNavi extends StatefulWidget {
  final Function(int) onTap;

  const MongleeBottomNavi({Key? key, required this.onTap}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MongleeBottomNavi();
}

class _MongleeBottomNavi extends State<MongleeBottomNavi> {
  int _selectedIdx = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: List.generate(
        _bottomNaviList.length,
        (index) => BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: SizedBox(
              width: 24,
              height: 24,
              child: SvgPicture.asset(
                _bottomNaviList[index].image,
                colorFilter: ColorFilter.mode(index == _selectedIdx ? primaryColor : gray400, BlendMode.srcIn),
              ),
            ),
          ),
          label: _bottomNaviList[index].text,
        ),
      ),
      currentIndex: _selectedIdx,
      selectedItemColor: primaryColor,
      unselectedItemColor: gray400,
      selectedLabelStyle: _selectedLabelStyle,
      unselectedLabelStyle: _unSelectedLabelStyle,
      onTap: (idx) {
        widget.onTap.call(idx);
        if (mounted) {
          setState(() {
            _selectedIdx = idx;
          });
        }
      },
    );
  }

  final TextStyle _selectedLabelStyle = Styler.style(
      color: primaryColor, fontSize: 12, fontWeight: FontWeight.w600);
  final TextStyle _unSelectedLabelStyle =
      Styler.style(color: gray400, fontSize: 12, fontWeight: FontWeight.w500);

  final List<_BottomModel> _bottomNaviList = [
    _BottomModel(
        image: 'assets/images/calendar_icon.svg', text: '일정', selected: false),
    _BottomModel(
        image: 'assets/images/search_icon.svg', text: 'MBTI', selected: false),
    _BottomModel(
        image: 'assets/images/profile_icon.svg', text: '마이', selected: false),
  ];
}

class _BottomModel {
  final String image;
  final String text;
  bool selected;

  _BottomModel(
      {required this.image, required this.text, required this.selected});
}
