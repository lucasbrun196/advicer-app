import 'package:advicer_app/app/core/exceptions/auth_exception.dart';
import 'package:advicer_app/app/modules/auth/domain/entities/new_user.dart';
import 'package:advicer_app/app/modules/auth/domain/entities/user_info.dart';
import 'package:advicer_app/app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:advicer_app/app/modules/auth/domain/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class AuthServiceImp extends AuthService {
  final AuthRepository authRepository;
  AuthServiceImp({required this.authRepository});

  @override
  Future<bool> login(UserInfos userinfos) async {
    final String userUid = await authRepository.login(userinfos);
    if (userUid != '' || userUid.isNotEmpty) {
      return true;
    }
    return false;
  }

  @override
  Future<bool> createAccount(NewUser newuser) async {
    try {
      final newUserOnAuth = await authRepository.createUserOnAuth(newuser);
      if (newUserOnAuth != '' || newUserOnAuth.isNotEmpty) {
        await authRepository.createUserOnDb(newuser, newUserOnAuth);
        return true;
      } else {
        return false;
      }
    } on FirebaseAuthException catch (e) {
      throw AuthException(code: e.code, message: e.message);
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> isUserIsLogged() async {
    String userUid = await authRepository.isUserIsLogged();
    if (userUid != '' || userUid.trim().isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<void> sendEmailToResetPassword(String email) async {
    return await authRepository.sendEmailToResetPassword(email);
  }

  @override
  Future<bool> checkInternet() async {
    return await InternetConnectionChecker().hasConnection;
  }

  @override
  Future<void> createEmptyAdvicesListDb() async {
    String userUid = await authRepository.isUserIsLogged();
    if (userUid != '' || userUid.trim().isNotEmpty) {
      return await authRepository.createEmptyListOnUserDb(userUid);
    } else {
      throw Exception();
    }
  }
}
