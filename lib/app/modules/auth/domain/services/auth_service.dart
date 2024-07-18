import 'package:advicer_app/app/modules/auth/domain/entities/user_info.dart';

abstract class AuthService {
  Future<bool> login(UserInfos userinfos);
}
