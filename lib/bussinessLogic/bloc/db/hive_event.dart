
part of 'hive_bloc.dart';
abstract class HiveEvent {
const HiveEvent();
}
class OpenHiveBox extends HiveEvent {}

class AddDataonHive extends HiveEvent {
final HivedbModel hivedbModel;
const AddDataonHive({required this.hivedbModel});
List<Object> get props => [hivedbModel];
}
class GetDataFromHive extends HiveEvent {
const GetDataFromHive();

}