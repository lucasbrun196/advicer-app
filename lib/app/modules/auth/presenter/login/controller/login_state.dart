part of 'login_controller.dart';

enum LoginStatus { initial, loading, error, success }

class LoginState extends Equatable {
  final LoginStatus loginStatus;

  const LoginState({
    required this.loginStatus,
  });

  @override
  List<Object?> get props => [loginStatus];

  const LoginState.initial() : this(loginStatus: LoginStatus.initial);

  LoginState copyWith({
    LoginStatus? loginStatus,
  }) {
    return LoginState(
      loginStatus: loginStatus ?? this.loginStatus,
    );
  }
}
