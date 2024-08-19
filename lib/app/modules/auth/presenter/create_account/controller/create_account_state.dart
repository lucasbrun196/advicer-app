part of 'create_account_controller.dart';

enum CreateAccountStatus { initial, loading, error, success }

class CreateAccountState extends Equatable {
  final CreateAccountStatus createAccountStatus;
  final String? errorMessage;

  const CreateAccountState({
    required this.createAccountStatus,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
        createAccountStatus,
        errorMessage,
      ];

  const CreateAccountState.initial()
      : this(
            createAccountStatus: CreateAccountStatus.initial,
            errorMessage: 'Error when creating account');

  CreateAccountState copyWith({
    CreateAccountStatus? createAccountStatus,
    String? errorMessage,
  }) {
    return CreateAccountState(
      createAccountStatus: createAccountStatus ?? this.createAccountStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
