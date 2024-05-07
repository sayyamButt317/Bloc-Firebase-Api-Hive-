part of 'firebase_bloc.dart';

abstract class FirebaseEvent {
  const FirebaseEvent();
  List<Object> get props => [];
}

class Create extends FirebaseEvent {
  final String name;

  const Create({required this.name});

  @override
  List<Object> get props => [name];
}

class GetData extends FirebaseEvent {
  const GetData();
}
