import 'package:advicer_app/app/modules/auth/data/datasources/auth_remote_datasource.dart';
import 'package:advicer_app/app/modules/auth/data/repositories/auth_repository_imp.dart';
import 'package:advicer_app/app/modules/auth/datasource/auth_datasource_imp.dart';
import 'package:advicer_app/app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:advicer_app/app/modules/auth/domain/services/auth_service.dart';
import 'package:advicer_app/app/modules/auth/presenter/login/controller/login_controller.dart';
import 'package:advicer_app/app/modules/auth/presenter/login/login_view.dart';
import 'package:advicer_app/app/modules/auth/presenter/splash/splash_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'domain/services/auth_service_imp.dart';

class AuthModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton<AuthRemoteDatasource>(AuthDatasourceImp.new);
    i.addLazySingleton<AuthRepository>(AuthRepositoryImp.new);
    i.addLazySingleton<AuthService>(AuthServiceImp.new);
    i.addLazySingleton(LoginController.new);
    i.addInstance(FirebaseAuth.instance);
  }

  @override
  void routes(r) {
    r.child('/',
        child: (context) => LoginView(
              controller: Modular.get(),
            ));
    r.child('/login', child: (context) => const SplashView());
  }
}
