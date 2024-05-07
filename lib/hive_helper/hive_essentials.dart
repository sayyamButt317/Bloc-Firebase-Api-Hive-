import 'package:hive/hive.dart';
import 'package:msb_task3/Network/service/db_model.dart';

void registerAdapters() {
  Hive.registerAdapter(HivedbModelAdapter());
}

class HiveTypes {
  static const int hivedbModel = 0;
}

class HiveAdapters {
  static const String hivedbModel = 'HivedbModelAdapter';
}

class HivedbModelFields {
  static const int name = 0;
}
