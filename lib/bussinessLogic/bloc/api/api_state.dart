import 'package:msb_task3/Network/model/user_model.dart';
import '../../../helper/enum/status.dart';

class ApiState {
  final TaskStatus postStatus;
  final String message;
  final String searchMessage;
  final List<ApiModel> apidataList;
  final List<ApiModel> tempdataList;

  const ApiState(
      {this.postStatus = TaskStatus.loading,
      this.apidataList = const <ApiModel>[],
      this.tempdataList = const <ApiModel>[],
      this.searchMessage = "",
      this.message = ""});

  List<Object?> get props => [postStatus, message, apidataList, tempdataList];

  ApiState copyWith({
    TaskStatus? postStatus,
    String? message,
    String? searchMessage,
    List<ApiModel>? apidataList,
    List<ApiModel>? tempdataList,
  }) {
    return ApiState(
      postStatus: postStatus ?? this.postStatus,
      message: message ?? this.message,
      searchMessage: searchMessage ?? this.searchMessage,
      apidataList: apidataList ?? this.apidataList,
      tempdataList: tempdataList ?? this.tempdataList,
    );
  }
}
