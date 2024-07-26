abstract class HomeDatabaseDatasource{
  Future<Map<String, dynamic>> getUserData(String userUid);

  Future<String> getCurrentUserUid();
}