abstract class AuthFirestoreRemote {
  Future<void> createUserOnDb(Map<String, dynamic> mapUser, String uid);

  Future<void> createEmptyAdvices(String uid);
}
