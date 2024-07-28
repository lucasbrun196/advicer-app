import 'package:advicer_app/app/modules/auth/domain/entities/new_user.dart';
import 'package:advicer_app/app/modules/auth/domain/entities/user_info.dart';

abstract class AuthService {
  Future<bool> login(UserInfos userinfos);

  Future<bool> createAccount(NewUser newuser);

  Future<bool> isUserIsLogged();
}
