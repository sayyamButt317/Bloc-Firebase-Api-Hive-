part of 'hive_bloc.dart';

sealed class HiveState extends Equatable {
  const HiveState();

  @override
  List<Object> get props => [];
}

class HiveInitial extends HiveState {
  @override
  List<Object> get props => [];
}

class DataLoading extends HiveState {
  const DataLoading();
  @override
  List<Object> get props => [];
}

class DisplayAllDatas extends HiveState {
  final List<HivedbModel> hivedbModel;
  const DisplayAllDatas({required this.hivedbModel});
  @override
  List<Object> get props => [hivedbModel];
}
