part of 'firebase_bloc.dart';

class FirebaseState {
  final TaskStatus taskStatus;
  final List<FirebaseModel> myfirebasedata;
  final String message;

  const FirebaseState(
      {this.taskStatus = TaskStatus.loading,
      this.myfirebasedata = const <FirebaseModel>[],
      this.message = ""});

  List<Object?> get props => [taskStatus, myfirebasedata];

  FirebaseState copywith({
    TaskStatus? taskStatus,
    List<FirebaseModel>? myfirebasedata,
    String? message,
  }) {
    return FirebaseState(
      taskStatus: taskStatus ?? this.taskStatus,
      myfirebasedata: myfirebasedata ?? this.myfirebasedata,
      message: message ?? this.message,
    );
  }
}
