part of 'firebase_bloc.dart';

sealed class FirebaseState extends Equatable {
  const FirebaseState();
}

final class FirebaseInitial extends FirebaseState {
  @override
  List<Object> get props => [];
}

class FirebaseAdding extends FirebaseState {
  @override
  List<Object> get props => [];
}

class FirebaseAdded extends FirebaseState {
  @override
  List<Object> get props => [];
}

class FirebaseError extends FirebaseState {
  final String error;
  const FirebaseError(this.error);
  @override
  List<Object?> get props => [error];
}

class FirebaseLoading extends FirebaseState {
  @override
  List<Object> get props => [];
}

class FirebaseLoaded extends FirebaseState {
  final List<ProductModel> mydata;
  const FirebaseLoaded({required this.mydata});

  @override
  List<Object?> get props => [mydata];
}
