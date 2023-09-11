import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monglee/page/home/views/search/views/search_field.dart';
import 'package:monglee/util/moglee_color.dart';

class SearchPage extends StatelessWidget{
  SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchField(),
      backgroundColor: gray150,
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

            ],
          ),
        ),
      ),
    );
  }
}