abstract class ApiEvent {
  List<Object> get props => [];
}

class PostFetched extends ApiEvent {}

class SearchItem extends ApiEvent {
  final String query;
  SearchItem(this.query);
}
