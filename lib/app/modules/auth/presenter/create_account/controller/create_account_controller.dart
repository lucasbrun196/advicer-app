import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_account_state.dart';

class CreateAccountController extends Cubit<CreateAccountState> {
  CreateAccountController(super.initialState);

  Future<void> createAccount() async {
    emit(state.copyWith(createAccountStatus: CreateAccountStatus.loading));
  }
}
