part of 'db_bloc.dart';

abstract class DbEvent extends Equatable {
  const DbEvent();

  @override
  List<Object> get props => [];
}

class Create extends DbEvent {
  final HivedbModel hivedbModel;
  const Create({required this.hivedbModel});
  @override
  List<Object> get props => [hivedbModel];
}

class GetData extends DbEvent {
  const GetData();
  @override
  List<Object> get props => [];
}
