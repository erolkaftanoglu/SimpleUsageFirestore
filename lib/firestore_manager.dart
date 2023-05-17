import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasedemo/user_model.dart';

class FirestoreManager {
  static final FirestoreManager _instance =
      FirestoreManager._privateConstructor();
  FirestoreManager._privateConstructor();

  static FirestoreManager get instance => _instance;

  final CollectionReference _collection =
      FirebaseFirestore.instance.collection('users');

  Future<List<User>> getAllUsers() async {
    QuerySnapshot querySnapshot = await _collection.get();
    return querySnapshot.docs
        .map((doc) => User.fromDocumentSnapshot(doc))
        .toList();
  }

  Future<User> getUserById(String userId) async {
    DocumentSnapshot documentSnapshot = await _collection.doc(userId).get();
    return User.fromDocumentSnapshot(documentSnapshot);
  }

  Future<void> addUser(User user) async {
    await _collection.doc(user.id).set(user.toMap());
  }

  Future<void> updateUser(User user) async {
    await _collection.doc(user.id).update(user.toMap());
  }

  Future<void> deleteUser(String userId) async {
    await _collection.doc(userId).delete();
  }
}
