import 'package:advicer_app/app/modules/auth/domain/services/auth_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'splash_state.dart';

class SplashController extends Cubit<SplashState> {
  final AuthService authService;
  SplashController(this.authService) : super(const SplashState.initial());

  void userIsAvaliable() async {
    bool uidIsAvaliable = await authService.isUserIsLogged();
    if (uidIsAvaliable) {
      //Modular.to.navigate('/home/homepage');
      Modular.to.navigate('/login');
    } else {
      Modular.to.navigate('/login');
    }
  }
}
