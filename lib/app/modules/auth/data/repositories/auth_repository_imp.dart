import 'package:advicer_app/app/modules/auth/data/datasources/auth_firestore_remote.dart';
import 'package:advicer_app/app/modules/auth/data/datasources/auth_remote_datasource.dart';
import 'package:advicer_app/app/modules/auth/data/dto/new_user_dto.dart';
import 'package:advicer_app/app/modules/auth/domain/entities/new_user.dart';
import 'package:advicer_app/app/modules/auth/domain/entities/user_info.dart';
import 'package:advicer_app/app/modules/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImp extends AuthRepository {
  final AuthRemoteDatasource authRemoteDatasource;
  final AuthFirestoreRemote authFirestoreRemote;
  AuthRepositoryImp(
      {required this.authRemoteDatasource, required this.authFirestoreRemote});
  @override
  Future<String> login(UserInfos userInfos) {
    return authRemoteDatasource.login(userInfos);
  }

  @override
  Future<String> createUserOnAuth(NewUser newuser) async {
    return authRemoteDatasource.createUserOnAuth(
        newuser.email, newuser.password);
  }

  @override
  Future<void> createUserOnDb(NewUser newuser, String uid) async {
    final newUserToMap = NewUserDto.toMap(newuser);
    return authFirestoreRemote.createUserOnDb(newUserToMap, uid);
  }

  @override
  Future<String> isUserIsLogged() async {
    return authRemoteDatasource.getLastUserUid();
  }

  @override
  Future<void> sendEmailToResetPassword(String email) async {
    return await authRemoteDatasource.sendEmailToResetPassword(email);
  }
}
