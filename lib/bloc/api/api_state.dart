import 'package:equatable/equatable.dart';
import 'package:msb_task3/Network/model/user_model.dart';
import '../../enum/status.dart';

class ApiState extends Equatable {
  final TaskStatus postStatus;
  final String message;
  final String searchMessage;
  final List<UserModel> postList;
  final List<UserModel> temPostList;

  const ApiState(
      {this.postStatus = TaskStatus.loading,
      this.postList = const <UserModel>[],
      this.temPostList = const <UserModel>[],
      this.searchMessage = "",
      this.message = ""});

  @override
  List<Object?> get props => [postStatus, message, postList, temPostList];

  ApiState copyWith({
    TaskStatus? postStatus,
    String? message,
    String? searchMessage,
    List<UserModel>? postList,
    List<UserModel>? temPostList,
  }) {
    return ApiState(
      postStatus: postStatus ?? this.postStatus,
      message: message ?? this.message,
      searchMessage: searchMessage ?? this.searchMessage,
      postList: postList ?? this.postList,
      temPostList: temPostList ?? this.temPostList,
    );
  }
}
