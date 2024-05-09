abstract class ApiEvent {}

class FetchApiData extends ApiEvent {}

class SearchItem extends ApiEvent {
  final String query;
  SearchItem(this.query);
}
