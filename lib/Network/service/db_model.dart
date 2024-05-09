import 'package:hive/hive.dart';

part 'db_model.g.dart';

@HiveType(typeId: 0)
class HivedbModel extends HiveObject {
  @HiveField(0)
  String name;

  HivedbModel(this.name);
}
