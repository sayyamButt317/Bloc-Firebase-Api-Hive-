import 'package:hive/hive.dart';
import 'package:msb_task3/Network/service/db_model.dart';

void registerAdapters() {
  Hive.registerAdapter(HivedbModelAdapter());
}
