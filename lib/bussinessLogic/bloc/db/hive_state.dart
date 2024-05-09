import 'package:msb_task3/Network/service/db_model.dart';
import '../../../helper/enum/status.dart';

 class HiveState {
  final TaskStatus postStatus;
  final String message;
  final List<HivedbModel> hivedbModelList;

  const HiveState({
    this.postStatus = TaskStatus.loading,
    this.message = "",
    this.hivedbModelList = const <HivedbModel>[],
  });

  List<Object?> get props => [postStatus, message, hivedbModelList];

  HiveState copyWith({
    TaskStatus? postStatus,
    String? message,
    List<HivedbModel>? hivedbModelList,
  }) {
    return HiveState(
      postStatus: postStatus?? this.postStatus,
      message: message?? this.message,
      hivedbModelList: hivedbModelList?? this.hivedbModelList,
    );
  }
}
