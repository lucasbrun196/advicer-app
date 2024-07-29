import 'package:advicer_app/app/modules/home/data/datasource/home_database_datasource.dart';
import 'package:advicer_app/app/modules/home/data/dto/user_data_dto.dart';
import 'package:advicer_app/app/modules/home/domain/entities/user_data.dart';
import 'package:advicer_app/app/modules/home/domain/repositories/home_repository.dart';

class HomeRepositoryImp extends HomeRepository {
  final HomeDatabaseDatasource homeDatabaseDatasource;

  HomeRepositoryImp({required this.homeDatabaseDatasource});
  @override
  Future<UserData> getUserData(String userUid) async {
    try {
      final userData = await homeDatabaseDatasource.getUserData(userUid);
      return UserDataDto.fromMap(userData);
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<String> getCurrentUserUid() async {
    return homeDatabaseDatasource.getCurrentUserUid();
  }

  @override
  Future<void> logout() async {
    return homeDatabaseDatasource.logout();
  }
}
