import 'package:advicer_app/app/modules/home/domain/entities/user_data.dart';

import '../entities/about_data.dart';
import '../entities/advice_data.dart';

abstract class HomeService {
  Future<UserData> getUserData(String userUid);

  Future<String> getCurrentUserUid();

  Future<void> logout();

  Future<AdviceData> getAdvice();

  Future<bool> checkInternetConnection();

  Future<AboutData> getAboutDataInformation();

  Future<void> saveAdvice(int id, String message);

  Future<Map<String, dynamic>> checkSavedAdvices();
}
