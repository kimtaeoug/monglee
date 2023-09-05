import 'package:flutter/cupertino.dart';
import 'package:monglee/util/moglee_color.dart';
import 'package:monglee/util/styler.dart';

class MongleeChip extends StatelessWidget {
  final String text;
  final bool selected;

  MongleeChip({Key? key, required this.text, required this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: selected ? mintText : gray100,
          border: selected ? Border.all(color: primaryColor) : null),
      child: Text(
        text,
        style: selected ? _selectedStyle : _unSelectedStyle,
      ),
    );
  }

  final TextStyle _selectedStyle =
      Styler.style(color: mintText, fontWeight: FontWeight.w600);
  final TextStyle _unSelectedStyle =
      Styler.style(color: gray400, fontWeight: FontWeight.w500);
}
