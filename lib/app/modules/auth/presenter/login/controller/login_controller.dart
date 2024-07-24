import 'package:advicer_app/app/modules/auth/domain/services/auth_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../domain/entities/user_info.dart';

part 'login_state.dart';

class LoginController extends Cubit<LoginState> {
  final AuthService authService;
  LoginController(this.authService) : super(const LoginState.initial());

  Future<void> login(UserInfos userInfos) async {
    emit(state.copyWith(loginStatus: LoginStatus.loading));
    try {
      final loginResult = await authService.login(userInfos);
      if (loginResult) {
        emit(state.copyWith(loginStatus: LoginStatus.success));
        redirectToHome();
      } else {
        emit(state.copyWith(loginStatus: LoginStatus.error));
      }
    } catch (e) {
      emit(state.copyWith(loginStatus: LoginStatus.error));
    }
  }

  void redirectToHome() {
    Modular.to.navigate('/home/homepage');
  }
}
