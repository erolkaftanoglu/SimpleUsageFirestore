import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String id;
  String name;
  String email;

  User({required this.id, required this.name, required this.email});

  factory User.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
    return User(
      id: documentSnapshot.id,
      name: data['name'] ?? '',
      email: data['email'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
    };
  }

  set setName(String newName) {
    name = newName;
  }

  set setEmail(String newEmail) {
    email = newEmail;
  }
}
