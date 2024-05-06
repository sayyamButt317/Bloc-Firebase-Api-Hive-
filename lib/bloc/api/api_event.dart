import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class PostFetched extends UserEvent {}

class SearchItem extends UserEvent {
  final String query;
  SearchItem(this.query);
}
