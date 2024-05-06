import 'package:equatable/equatable.dart';
import 'package:msb_task3/Network/model/user_model.dart';
import '../../enum/status.dart';

class UserState extends Equatable {
  final PostStatus postStatus;
  final String message;
  final String searchMessage;
  final List<UserModel> postList;
  final List<UserModel> temPostList;

  const UserState(
      {this.postStatus = PostStatus.loading,
      this.postList = const <UserModel>[],
      this.temPostList = const <UserModel>[],
      this.searchMessage = "",
      this.message = ""});

  @override
  List<Object?> get props => [postStatus, message, postList, temPostList];

  UserState copyWith({
    PostStatus? postStatus,
    String? message,
    String? searchMessage,
    List<UserModel>? postList,
    List<UserModel>? temPostList,
  }) {
    return UserState(
      postStatus: postStatus ?? this.postStatus,
      message: message ?? this.message,
      searchMessage: searchMessage ?? this.searchMessage,
      postList: postList ?? this.postList,
      temPostList: temPostList ?? this.temPostList,
    );
  }
}
