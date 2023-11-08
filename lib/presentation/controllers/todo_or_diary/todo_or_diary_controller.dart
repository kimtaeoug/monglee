import 'package:get/get.dart';

class TODController extends GetxController{
  Rx<DateTime> sDate = DateTime.now().obs;
  Rx<double> widgetSize = 0.0.obs;
  //true - monthCalender, false - weekCalendar
  RxBool calendarFormat = false.obs;
}