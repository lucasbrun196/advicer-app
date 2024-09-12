import 'package:advicer_app/app/modules/auth/data/datasources/auth_firestore_remote.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDatasourceImp extends AuthFirestoreRemote {
  final FirebaseFirestore firebaseFirestore;

  FirestoreDatasourceImp({required this.firebaseFirestore});
  @override
  Future<void> createUserOnDb(Map<String, dynamic> mapUser, String uid) async {
    try {
      await firebaseFirestore.collection('users').doc(uid).set(mapUser);
    } catch (e) {
      throw Exception();
    }
  }
}
