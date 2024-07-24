import 'package:advicer_app/app/modules/auth/domain/entities/new_user.dart';
import 'package:advicer_app/app/modules/auth/domain/services/auth_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'create_account_state.dart';

class CreateAccountController extends Cubit<CreateAccountState> {
  final AuthService authService;
  CreateAccountController(this.authService)
      : super(const CreateAccountState.initial());

  Future<void> createAccount(NewUser newuser) async {
    emit(state.copyWith(createAccountStatus: CreateAccountStatus.loading));
    try {
      final isAccountIsAvaliable = await authService.createAccount(newuser);
      if (isAccountIsAvaliable) {
        emit(state.copyWith(createAccountStatus: CreateAccountStatus.success));
        backToLogin();
      } else {
        emit(state.copyWith(createAccountStatus: CreateAccountStatus.error));
      }
    } catch (e) {
      emit(state.copyWith(createAccountStatus: CreateAccountStatus.error));
    }
  }

  void backToLogin() {
    Modular.to.popUntil(
      ModalRoute.withName('/login'),
    );
  }
}
