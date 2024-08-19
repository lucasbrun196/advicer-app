part of 'forgot_password_controller.dart';

enum ForgotPasswordStatus { initial, loading, success, error }

class ForgotPasswordState extends Equatable {
  final ForgotPasswordStatus forgotPasswordStatus;
  final String? errorMessage;

  const ForgotPasswordState({
    required this.forgotPasswordStatus,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
        forgotPasswordStatus,
        errorMessage,
      ];

  const ForgotPasswordState.initial()
      : this(
            forgotPasswordStatus: ForgotPasswordStatus.initial,
            errorMessage: 'Error when sending email');

  ForgotPasswordState copyWith({
    ForgotPasswordStatus? forgotPasswordStatus,
    String? errorMessage,
  }) {
    return ForgotPasswordState(
      forgotPasswordStatus: forgotPasswordStatus ?? this.forgotPasswordStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
