import 'package:advicer_app/app/modules/auth/data/datasources/auth_firestore_remote.dart';
import 'package:advicer_app/app/modules/auth/data/datasources/auth_remote_datasource.dart';
import 'package:advicer_app/app/modules/auth/data/repositories/auth_repository_imp.dart';
import 'package:advicer_app/app/modules/auth/datasource/auth_datasource_imp.dart';
import 'package:advicer_app/app/modules/auth/datasource/firestore_datasource_imp.dart';
import 'package:advicer_app/app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:advicer_app/app/modules/auth/domain/services/auth_service.dart';
import 'package:advicer_app/app/modules/auth/presenter/create_account/controller/create_account_controller.dart';
import 'package:advicer_app/app/modules/auth/presenter/create_account/create_account_view.dart';
import 'package:advicer_app/app/modules/auth/presenter/forgot_password/controller/forgot_password_controller.dart';
import 'package:advicer_app/app/modules/auth/presenter/forgot_password/forgot_password_view.dart';
import 'package:advicer_app/app/modules/auth/presenter/login/controller/login_controller.dart';
import 'package:advicer_app/app/modules/auth/presenter/login/login_view.dart';
import 'package:advicer_app/app/modules/auth/presenter/splash/controller/splash_controller.dart';
import 'package:advicer_app/app/modules/auth/presenter/splash/splash_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
    i.addLazySingleton(CreateAccountController.new);
    i.addInstance(FirebaseFirestore.instance);
    i.addLazySingleton<AuthFirestoreRemote>(FirestoreDatasourceImp.new);
    i.addLazySingleton(SplashController.new);
    i.addLazySingleton(ForgotPasswordController.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      transition: TransitionType.downToUp,
      child: (context) => SplashView(
        controller: Modular.get(),
      ),
    );
    r.child(
      '/login',
      child: (context) => LoginView(
        controller: Modular.get(),
      ),
    );
    r.child(
      '/createaccount',
      child: (context) => CreateAccountView(
        controller: Modular.get(),
      ),
    );
    r.child(
      '/forgotpassword',
      child: (context) => ForgotPasswordView(
        controller: Modular.get(),
      ),
    );
  }
}
