import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monglee/page/home/views/monglee_bottom_navigation.dart';
import 'package:monglee/util/moglee_color.dart';

import 'calendar/monglee_calendar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: Scaffold(
      backgroundColor: gray150,
      body: MongleeCaneldar(),
      bottomNavigationBar: MongleeBottomNavi(onTap: (idx) {}),
    ), onWillPop: (){
      return Future(() => false);
    });
  }
}
