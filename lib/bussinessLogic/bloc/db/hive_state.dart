import 'package:msb_task3/Network/service/db_model.dart';

enum TaskStatus { loading, success, failure }

abstract class HiveState {
  const HiveState();

  List<Object?> get props => [];
}

class HiveInitial extends HiveState {
  const HiveInitial();

  @override
  List<Object?> get props => [TaskStatus.loading, 'Hive Initializing...', ''];
}

class DataLoading extends HiveState {
  const DataLoading();

  @override
  List<Object?> get props => [TaskStatus.loading, 'Loading Data...', ''];
}

class DisplayData extends HiveState {
  final List<HivedbModel> hivedbModelList;

  const DisplayData({
    required this.hivedbModelList,
  });

  @override
  List<Object?> get props =>
      [TaskStatus.success, 'Data Loaded', hivedbModelList];
}
