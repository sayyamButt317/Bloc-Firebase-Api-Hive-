part of 'db_bloc.dart';

class DbState extends Equatable {
  const DbState();

  @override
  List<Object> get props => [];
}

class DbInitial extends DbState {
  @override
  List<Object> get props => [];
}

class DataLoading extends DbState {
  const DataLoading();
  @override
  List<Object> get props => [];
}

class DisplayAllDatas extends DbState {
  final List<HivedbModel> hivedbModel;
  const DisplayAllDatas({required this.hivedbModel});
  @override
  List<Object> get props => [hivedbModel];
}
