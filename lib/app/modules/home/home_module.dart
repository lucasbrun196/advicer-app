import 'package:advicer_app/app/modules/home/presenter/controller/home_controller.dart';
import 'package:advicer_app/app/modules/home/presenter/home_view.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(HomeController.new);
  }

  @override
  void routes(r) {
    r.child(
      '/homepage',
      child: (context) => HomeView(
        homeController: Modular.get(),
      ),
    );
  }
}
