import 'package:advicer_app/app/modules/home/domain/entities/user_data.dart';

import '../entities/about_data.dart';
import '../entities/advice_data.dart';

abstract class HomeRepository {
  Future<UserData> getUserData(String userUid);
  Future<String> getCurrentUserUid();
  Future<void> logout();

  Future<AdviceData> getAdvice();

  Future<AboutData> getAboutDataInformation();

  Future<void> saveAdviceRepo(int id, String message);

  Future<Map<String, dynamic>> getSavedAdvices();

  Future<void> deleteAdvice(String adviceId);
}
