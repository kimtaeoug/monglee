import 'package:flutter/cupertino.dart';
import 'package:monglee/util/moglee_color.dart';
import 'package:monglee/util/styler.dart';

///
/// ToDoList Item
///
@immutable
class ToDoItem extends StatelessWidget{
  final String title;
  final String? contents;
  final String? time;
  final String? location;

  ToDoItem({Key? key, required this.title, this.contents, this.time, this.location}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: primaryColor
      ),
      
    );
  }

  final TextStyle _titleStyle = Styler.style(
    fontSize: 16,
    fontWeight: FontWeight.w700
  );
  final TextStyle _contentsStyle = Styler.style(
    fontWeight: FontWeight.w500
  );


}