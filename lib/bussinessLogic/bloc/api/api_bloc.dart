import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msb_task3/Network/model/user_model.dart';
import 'package:msb_task3/bussinessLogic/bloc/api/api_state.dart';
import 'package:msb_task3/helper/enum/status.dart';
import 'api_event.dart';
import 'package:msb_task3/Network/repository/api_repository.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  late final ApiRepository apiRepository;
  List<ApiModel> temPostList = [];
  ApiBloc() : super(const ApiState()) {
    apiRepository = ApiRepository(baseUrl: 'https://reqres.in/api');
    on<FetchApiData>(getApiData);
    on<SearchItem>(getFilteredData);
  }

  void getApiData(FetchApiData event, Emitter<ApiState> emit) async {
    try {
      final userList = await apiRepository.getUserData();
      emit(state.copyWith(
        postStatus: TaskStatus.success,
        message: 'Success',
        apidataList: userList,
      ));
    } catch (error) {
      emit(state.copyWith(
        postStatus: TaskStatus.failure,
        message: error.toString(),
      ));
    }
  }

  void getFilteredData(SearchItem event, Emitter<ApiState> emit) async {
    if (event.query.isEmpty) {
      emit(state.copyWith(tempdataList: [], searchMessage: ""));
    } else {
      temPostList = state.apidataList
          .where((element) => element.firstName
              .toString()
              .toLowerCase()
              .contains(event.query.toLowerCase()))
          .toList();
      if (temPostList.isEmpty) {
        emit(state.copyWith(
            tempdataList: temPostList, searchMessage: 'No Data Found'));
      } else {
        emit(state.copyWith(tempdataList: temPostList, searchMessage: ""));
      }
    }
  }
}
