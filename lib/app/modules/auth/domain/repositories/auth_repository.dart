import 'package:advicer_app/app/modules/auth/domain/entities/user_info.dart';

abstract class AuthRepository {
  Future<String> login(UserInfos userInfos);
}
