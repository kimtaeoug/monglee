import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monglee/util/moglee_color.dart';
import 'package:monglee/util/styler.dart';

class MongleeTextInputField extends StatelessWidget {
  final String? hint;
  final Function(String?)? onFieldSubmitted;
  final Function()? onEditingCompleteFunction;
  final Function()? onTapFunction;
  final Function(String?)? onChanged;
  final Widget? subffix;

  MongleeTextInputField(
      {Key? key,
      this.hint,
      this.onFieldSubmitted,
      this.onEditingCompleteFunction,
      this.onTapFunction,
      this.onChanged,
      this.subffix})
      : super(key: key);

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 33,
      child: TextFormField(
        onTap: onTapFunction,
        onChanged: onChanged,
        onEditingComplete: onEditingCompleteFunction,
        onFieldSubmitted: onFieldSubmitted,
        textInputAction: TextInputAction.go,
        controller: controller,
        style: _textStyle,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          hintText: hint,
          hintStyle: _hintStyle,
          suffix: subffix,
        ),
      ),
    );
  }

  final TextStyle _hintStyle =
      Styler.style(color: gray300, fontSize: 16, fontWeight: FontWeight.w500);
  final TextStyle _textStyle =
      Styler.style(fontSize: 16, fontWeight: FontWeight.w600);
}
