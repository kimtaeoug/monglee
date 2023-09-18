import 'package:hive/hive.dart';
import 'package:monglee/util/constants.dart';

class MongleeHive{
  final Box box = Hive.box(MONGLEE_BOX);

  void init()async{
    await Hive.openBox(MONGLEE_BOX);
  }

  void read(){}

  void write(){}

  void delete(){}
}