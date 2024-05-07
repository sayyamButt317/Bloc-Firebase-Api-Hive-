class FirebaseModel {
  final String name;

  FirebaseModel({
    required this.name,
  });

  factory FirebaseModel.fromJson(Map<String, dynamic> json) {
    return FirebaseModel(name: json['name']);
  }
}
