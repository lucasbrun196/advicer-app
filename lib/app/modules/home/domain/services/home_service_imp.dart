import 'package:advicer_app/app/modules/home/domain/entities/user_data.dart';
import 'package:advicer_app/app/modules/home/domain/repositories/home_repository.dart';
import 'package:advicer_app/app/modules/home/domain/services/home_service.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../entities/advice_data.dart';

class HomeServiceImp implements HomeService {
  final HomeRepository homeRepository;
  HomeServiceImp({
    required this.homeRepository,
  });

  @override
  Future<UserData> getUserData(String userUid) async {
    return homeRepository.getUserData(userUid);
  }

  @override
  Future<String> getCurrentUserUid() async {
    return homeRepository.getCurrentUserUid();
  }

  @override
  Future<void> logout() async {
    return homeRepository.logout();
  }

  @override
  Future<AdviceData> getAdvice() async {
    return homeRepository.getAdvice();
  }

  @override
  Future<bool> checkInternetConnection() async {
    return await InternetConnectionChecker().hasConnection;
  }
}
