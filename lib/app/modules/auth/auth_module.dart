import 'package:advicer_app/app/modules/auth/presenter/login/login_view.dart';
import 'package:advicer_app/app/modules/auth/presenter/splash/splash_view.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (context) => const LoginView());
    r.child('/login', child: (context) => const SplashView());
  }
}
