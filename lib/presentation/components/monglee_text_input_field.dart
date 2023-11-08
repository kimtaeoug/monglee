import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monglee/app/config/moglee_color.dart';
import 'package:monglee/app/extensions/styler.dart';


class MongleeTextInputField extends StatelessWidget {
  final TextEditingController controller;
  final String? hint;
  final Function(String?)? onFieldSubmitted;
  final Function()? onEditingCompleteFunction;
  final Function()? onTapFunction;
  final Function(String?)? onChanged;
  final Widget? subffix;

  MongleeTextInputField(
      {Key? key,
      required this.controller,
      this.hint,
      this.onFieldSubmitted,
      this.onEditingCompleteFunction,
      this.onTapFunction,
      this.onChanged,
      this.subffix})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextFormField(
            onTap: onTapFunction,
            onChanged: onChanged,
            onEditingComplete: onEditingCompleteFunction,
            onFieldSubmitted: onFieldSubmitted,
            textInputAction: TextInputAction.go,
            controller: controller,
            style: _textStyle,
            cursorColor: primaryColor,
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
          const SizedBox(
            height: 2,
          ),
          Container(
            width: Get.width,
            height: 0.5,
            color: gray200,
          )
        ],
      ),
    );
  }

  final TextStyle _hintStyle =
      Styler.style(color: gray300, fontSize: 16, fontWeight: FontWeight.w500);
  final TextStyle _textStyle =
      Styler.style(fontSize: 16, fontWeight: FontWeight.w600);
}
