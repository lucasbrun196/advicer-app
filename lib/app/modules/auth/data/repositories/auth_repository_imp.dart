import 'package:advicer_app/app/modules/auth/data/datasources/auth_remote_datasource.dart';
import 'package:advicer_app/app/modules/auth/domain/entities/user_info.dart';
import 'package:advicer_app/app/modules/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImp extends AuthRepository {
  final AuthRemoteDatasource authRemoteDatasource;
  AuthRepositoryImp({required this.authRemoteDatasource});
  @override
  Future<String> login(UserInfos userInfos) {
    return authRemoteDatasource.login(userInfos);
  }
}
