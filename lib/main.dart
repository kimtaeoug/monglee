import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monglee/util/app_pages.dart';
import 'package:monglee/util/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Zone.current.run(() async {
    runApp(EasyLocalization(
        useOnlyLangCode: true,
        supportedLocales: const [Locale('ko', 'KR')],
        path: 'assets/translations',
        child: const MyApp()));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      initialRoute: Routes.HOME,
      // initialRoute: AppPages.INITIAL,
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
