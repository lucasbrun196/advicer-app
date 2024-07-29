import 'package:advicer_app/app/modules/auth/data/datasources/auth_remote_datasource.dart';
import 'package:advicer_app/app/modules/auth/domain/entities/user_info.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthDatasourceImp extends AuthRemoteDatasource {
  final FirebaseAuth firebaseAuth;
  AuthDatasourceImp({required this.firebaseAuth});

  @override
  Future<String> login(UserInfos userInfos) async {
    try {
      final UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
              email: userInfos.email, password: userInfos.password);
      return userCredential.user!.uid;
    } catch (e) {
      return '';
    }
  }

  @override
  Future<String> createUserOnAuth(String email, String password) async {
    try {
      final newUser = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return newUser.user!.uid;
    } catch (e) {
      return '';
    }
  }

  @override
  Future<String> getLastUserUid() async {
    return firebaseAuth.currentUser?.uid ?? '';
  }

  @override
  Future<bool> sendEmailToResetPassword(String email) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
      return true;
    } catch (e) {
      return false;
    }
  }
}
