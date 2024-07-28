import 'package:advicer_app/app/modules/auth/domain/entities/new_user.dart';
import 'package:advicer_app/app/modules/auth/domain/entities/user_info.dart';

abstract class AuthRepository {
  Future<String> login(UserInfos userInfos);

  Future<String> createUserOnAuth(NewUser newuser);

  Future<void> createUserOnDb(NewUser newuser, String uid);

  Future<String> isUserIsLogged();
}
