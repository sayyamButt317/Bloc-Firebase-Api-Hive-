import 'package:bloc/bloc.dart';

import 'package:msb_task3/Network/model/firebase_model.dart';
import 'package:msb_task3/Network/repository/firebase_repository.dart';
import 'package:msb_task3/helper/enum/status.dart';

part 'firebase_event.dart';
part 'firebase_state.dart';

class FirebaseBloc extends Bloc<FirebaseEvent, FirebaseState> {
  final FirebaseRepository firebaseRepository;
  FirebaseBloc({required this.firebaseRepository})
      : super(const FirebaseState()) {
    on<AddDataonFireBase>(addData);
    on<GetDatafromFirebase>(getData);
  }

  void addData(AddDataonFireBase event, Emitter<FirebaseState> emit) async {
    try {
      await firebaseRepository.addDataonFirebase(name: event.name);
      final myfirebasedata = await firebaseRepository.getFirebasedata();
      emit(state.copywith(myfirebasedata: myfirebasedata));
    } catch (e) {
      emit(state.copywith(
          taskStatus: TaskStatus.failure, message: e.toString()));
    }
  }

  void getData(GetDatafromFirebase event, Emitter<FirebaseState> emit) async {
    try {
      emit(state.copywith(taskStatus: TaskStatus.loading));
      final data = await firebaseRepository.getFirebasedata();
      emit(
          state.copywith(taskStatus: TaskStatus.success, myfirebasedata: data));
    } catch (e) {
      emit(state.copywith(message: e.toString()));
    }
  }
}
