import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:advicer_app/app/modules/home/data/datasource/home_database_datasource.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeFirestoreDatasourceImp implements HomeDatabaseDatasource {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseAuth firebaseAuth;

  HomeFirestoreDatasourceImp(
      {required this.firebaseFirestore, required this.firebaseAuth});

  @override
  Future<Map<String, dynamic>> getUserData(String userUid) async {
    try {
      final doc = firebaseFirestore.collection('users').doc(userUid);
      final docSnapshot = await doc.get();
      if (docSnapshot.exists) {
        return docSnapshot.data() as Map<String, dynamic>;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<String> getCurrentUserUid() async {
    return firebaseAuth.currentUser!.uid;
  }

  @override
  Future<void> logout() async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<Map<String, dynamic>> getApiData() async {
    try {
      Map<String, dynamic> map = {};
      final uri = Uri.https('api.adviceslip.com', '/advice');
      final response = await http.get(uri);
      map = jsonDecode(response.body);
      return map;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<Map<String, dynamic>> getAboutDataInformation() async {
    try {
      final doc = firebaseFirestore.collection('about').doc('aboutDoc');
      final docSnapshot = await doc.get();
      if (docSnapshot.exists) {
        return docSnapshot.data() as Map<String, dynamic>;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<Map<String, dynamic>> getAdvicesMap() async {
    Map<String, dynamic> data = {};
    final String userUid = await getCurrentUserUid();
    final docSnapshot =
        await firebaseFirestore.collection('favAdvices').doc(userUid).get();
    if (docSnapshot.data() != null) {
      data = docSnapshot.data() as Map<String, dynamic>;
    }

    return data;
  }

  @override
  Future<void> saveAdviceDb(Map<String, dynamic> map) async {
    try {
      final uid = await getCurrentUserUid();
      final doc = firebaseFirestore.collection('favAdvices').doc(uid);
      final docSnapshot = await doc.get();
      if (docSnapshot.exists) {
        doc.update({
          map['id'].toString(): map['message'],
        });
      } else {
        doc.set({
          map['id'].toString(): map['message'],
        });
      }
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<void> deleteAdvice(String idToDelete) async {
    try {
      await getCurrentUserUid().then(
        (uid) => {
          firebaseFirestore.collection('favAdvices').doc(uid).update(
            {
              idToDelete: FieldValue.delete(),
            },
          ),
        },
      );
    } catch (e) {
      throw Exception();
    }
  }
}
