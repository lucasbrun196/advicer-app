import 'package:advicer_app/app/modules/home/domain/entities/user_data.dart';
import 'package:advicer_app/app/modules/home/domain/repositories/home_repository.dart';
import 'package:advicer_app/app/modules/home/domain/services/home_service.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../entities/about_data.dart';
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
    final internetConnection =
        InternetConnectionChecker.createInstance().hasConnection;
    return internetConnection;
  }

  @override
  Future<AboutData> getAboutDataInformation() async {
    return homeRepository.getAboutDataInformation();
  }

  @override
  Future<void> saveAdvice(int id, String message) async {
    return await homeRepository.saveAdviceRepo(id, message);
  }

  @override
  Future<Map<String, dynamic>> checkSavedAdvices() async {
    return await homeRepository.getSavedAdvices();
  }

  @override
  Future<void> deleteAdvice(String adviceId) async {
    return await homeRepository.deleteAdvice(adviceId);
  }

  @override
  Future<List<AdviceData>> getSavedAdvices() async {
    List<AdviceData> savedAdviceList = [];
    Map<String, dynamic> advicesMap = await homeRepository.getSavedAdvices();
    if (advicesMap.isNotEmpty) {
      advicesMap.forEach((key, value) {
        AdviceData adviceData = AdviceData(id: int.parse(key), advice: value);
        savedAdviceList.add(adviceData);
      });
    }

    return savedAdviceList;
  }
}
