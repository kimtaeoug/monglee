import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monglee/util/app_pages.dart';

void main() {
  Zone.current.run(()async{
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      title: 'Monglee',
      themeMode: ThemeMode.dark,
      builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: child!),
    );
  }
}
