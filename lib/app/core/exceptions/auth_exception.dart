class AuthException implements Exception {
  String? code;
  String? message;
  AuthException({
    this.code,
    this.message,
  }) {
    String defaultReturnMessage = 'Error';
    if (message != null) {
      defaultReturnMessage = message!;
    }
    switch (code) {
      case 'wrong-password':
        message = 'Wrong password.';
        break;
      case 'invalid-email':
      case 'auth/invalid-email':
        message = 'Invalid email';
        break;
      case 'user-not-found':
      case 'auth/user-not-found':
        message = 'User Not found';
        break;
      case 'email-already-in-use':
        message = 'This email already in use';
        break;
      case 'operation-not-allowed':
        message = 'Internal error, operation not allowed';
        break;
      case 'weak-password':
        message = 'Weak password';
        break;
      case 'account-exists-with-different-credential':
        message = 'It have already a account with this email';
        break;
      case 'auth/missing-android-pkg-name':
      case 'auth/missing-continue-uri':
      case 'auth/missing-ios-bundle-id':
      case 'auth/invalid-continue-uri':
      case 'auth/unauthorized-continue-uri':
      default:
        message = defaultReturnMessage;
        break;
    }
  }
}
