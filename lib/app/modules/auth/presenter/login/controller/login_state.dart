part of 'login_controller.dart';

enum LoginStatus { initial, loading, error, success }

class LoginState extends Equatable {
  final LoginStatus loginStatus;
  final String? errorMessage;

  const LoginState({
    required this.loginStatus,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [loginStatus, errorMessage];

  const LoginState.initial()
      : this(
          loginStatus: LoginStatus.initial,
          errorMessage: 'Login error',
        );

  LoginState copyWith({
    LoginStatus? loginStatus,
    String? errorMessage,
  }) {
    return LoginState(
      loginStatus: loginStatus ?? this.loginStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
