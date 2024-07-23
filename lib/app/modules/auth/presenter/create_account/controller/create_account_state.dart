part of 'create_account_controller.dart';

enum CreateAccountStatus { initial, loading, error, success }

class CreateAccountState extends Equatable {
  final CreateAccountStatus createAccountStatus;

  const CreateAccountState({
    required this.createAccountStatus,
  });

  @override
  List<Object?> get props => [createAccountStatus];

  const CreateAccountState.initial()
      : this(createAccountStatus: CreateAccountStatus.initial);

  CreateAccountState copyWith({
    CreateAccountStatus? createAccountStatus,
  }) {
    return CreateAccountState(
      createAccountStatus: createAccountStatus ?? this.createAccountStatus,
    );
  }
}
