import 'package:advicer_app/app/modules/auth/domain/entities/user_info.dart';

abstract class AuthRemoteDatasource {
  Future<String> login(UserInfos userInfos);

  Future<String> createUserOnAuth(String email, String password);
}
