abstract class HomeDatabaseDatasource {
  Future<Map<String, dynamic>> getUserData(String userUid);

  Future<String> getCurrentUserUid();

  Future<void> logout();

  Future<Map<String, dynamic>> getApiData();

  Future<Map<String, dynamic>> getAboutDataInformation();

  Future<void> saveAdviceDb(Map<String, dynamic> map);

  Future<Map<String, dynamic>> getAdvicesMap();

  Future<void> deleteAdvice(String adviceId);
}
