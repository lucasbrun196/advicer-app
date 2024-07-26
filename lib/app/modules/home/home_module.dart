import 'package:advicer_app/app/modules/home/data/datasource/home_database_datasource.dart';
import 'package:advicer_app/app/modules/home/data/repositories/home_repository_imp.dart';
import 'package:advicer_app/app/modules/home/domain/repositories/home_repository.dart';
import 'package:advicer_app/app/modules/home/domain/services/home_service.dart';
import 'package:advicer_app/app/modules/home/domain/services/home_service_imp.dart';
import 'package:advicer_app/app/modules/home/presenter/controller/home_controller.dart';
import 'package:advicer_app/app/modules/home/presenter/home_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'datasource/home_firestore_datasource_imp.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(HomeController.new);
    i.addInstance(FirebaseFirestore.instance);
    i.addInstance(FirebaseAuth.instance);
    i.addLazySingleton<HomeService>(HomeServiceImp.new);
    i.addLazySingleton<HomeRepository>(HomeRepositoryImp.new);
    i.addLazySingleton<HomeDatabaseDatasource>(HomeFirestoreDatasourceImp.new);

  }

  @override
  void routes(r) {
    r.child(
      '/homepage',
      child: (context) => HomeView(
        controller: Modular.get(),
      ),
    );
  }
}
