import 'package:hive/hive.dart';
import 'package:msb_task3/Network/service/db_model.dart';

class Boxes {
  static Future<Box<HivedbModel>> hiveBoxOpening() async {
    await Hive.openBox<HivedbModel>('myKey');
    return Hive.box<HivedbModel>('myKey');
  }
}
