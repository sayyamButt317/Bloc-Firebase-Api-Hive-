import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msb_task3/Network/model/user_model.dart';
import 'package:msb_task3/bloc/api/api_state.dart';
import 'package:msb_task3/enum/status.dart';
import 'api_event.dart';
import 'package:msb_task3/Network/repository/api_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  late final PostRepository postRepository;
  List<UserModel> temPostList = [];
  UserBloc() : super(const UserState()) {
    postRepository = PostRepository(baseUrl: 'https://reqres.in/api');
    on<PostFetched>(_fetchDataApi);
    on<SearchItem>(_filterList);
  }

  void _fetchDataApi(PostFetched event, Emitter<UserState> emit) async {
    try {
      final userList = await postRepository.fetchHttpData();
      emit(state.copyWith(
        postStatus: PostStatus.success,
        message: 'Success',
        postList: userList,
      ));
    } catch (error) {
      emit(state.copyWith(
        postStatus: PostStatus.failure,
        message: error.toString(),
      ));
    }
  }

  void _filterList(SearchItem event, Emitter<UserState> emit) async {
    if (event.query.isEmpty) {
      emit(state.copyWith(temPostList: [], searchMessage: ""));
    } else {
      temPostList = state.postList
          .where((element) => element.firstName
              .toString()
              .toLowerCase()
              .contains(event.query.toLowerCase()))
          .toList();
      if (temPostList.isEmpty) {
        emit(state.copyWith(
            temPostList: temPostList, searchMessage: 'No Data Found'));
      } else {
        emit(state.copyWith(temPostList: temPostList, searchMessage: ""));
      }
    }
  }
}
