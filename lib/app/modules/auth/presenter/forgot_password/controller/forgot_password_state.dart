part of 'forgot_password_controller.dart';

enum ForgotPasswordStatus { initial, loading, success, error }

class ForgotPasswordState extends Equatable {
  final ForgotPasswordStatus forgotPasswordStatus;

  const ForgotPasswordState({
    required this.forgotPasswordStatus,
  });

  @override
  List<Object?> get props => [
        forgotPasswordStatus,
      ];

  const ForgotPasswordState.initial()
      : this(forgotPasswordStatus: ForgotPasswordStatus.initial);

  ForgotPasswordState copyWith({
    ForgotPasswordStatus? forgotPasswordStatus,
  }) {
    return ForgotPasswordState(
      forgotPasswordStatus: forgotPasswordStatus ?? this.forgotPasswordStatus,
    );
  }
}
