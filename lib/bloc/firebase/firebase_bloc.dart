import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:msb_task3/Network/model/firebase_model.dart';
import 'package:msb_task3/Network/repository/firebaserepository.dart';

part 'firebase_event.dart';
part 'firebase_state.dart';

class FirebaseBloc extends Bloc<FirebaseEvent, FirebaseState> {
  final FirebaseRepository productRepository;
  FirebaseBloc({required this.productRepository}) : super(FirebaseInitial()) {
    on<Create>((event, emit) async {
      emit(FirebaseAdding());
      try {
        await productRepository.create(name: event.name);
        final updatedData = await productRepository.get();
        emit(FirebaseLoaded(mydata: updatedData)); 
      } catch (e) {
        emit(FirebaseError(e.toString()));
      }
    });

    on<GetData>((event, emit) async {
      emit(FirebaseLoading());
      await Future.delayed(const Duration(seconds: 1));
      try {
        final data = await productRepository.get();
        emit(FirebaseLoaded(mydata: data));
      } catch (e) {
        emit(FirebaseError(e.toString()));
      }
    });
  }
}
