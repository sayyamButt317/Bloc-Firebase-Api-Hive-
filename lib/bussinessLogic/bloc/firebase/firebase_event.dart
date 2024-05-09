part of 'firebase_bloc.dart';

abstract class FirebaseEvent {
  const FirebaseEvent();
}

class AddDataonFireBase extends FirebaseEvent {
  final String name;

  const AddDataonFireBase({required this.name});
}

class GetDatafromFirebase extends FirebaseEvent {
  const GetDatafromFirebase();
}
