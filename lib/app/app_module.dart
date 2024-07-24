import 'package:advicer_app/app/modules/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/auth/auth_module.dart';

class AppModule extends Module {
  @override
  void routes(r) {
    r.module(
      '/',
      module: AuthModule(),
    );
    r.module('/home', module: HomeModule());
  }
}
