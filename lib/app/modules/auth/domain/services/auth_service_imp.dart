import 'package:advicer_app/app/modules/auth/domain/entities/user_info.dart';
import 'package:advicer_app/app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:advicer_app/app/modules/auth/domain/services/auth_service.dart';

class AuthServiceImp implements AuthService {
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
}
