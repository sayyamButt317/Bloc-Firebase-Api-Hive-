part of 'hive_bloc.dart';

abstract class HiveEvent {
  const HiveEvent();

  List<Object> get props => [];
}

class Create extends HiveEvent {
  final HivedbModel hivedbModel;
  const Create({required this.hivedbModel});
  @override
  List<Object> get props => [hivedbModel];
}

class GetData extends HiveEvent {
  const GetData();
  @override
  List<Object> get props => [];
}
