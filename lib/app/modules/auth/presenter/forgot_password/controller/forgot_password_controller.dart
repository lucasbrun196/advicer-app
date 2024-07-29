import 'package:advicer_app/app/modules/auth/domain/services/auth_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'forgot_password_state.dart';

class ForgotPasswordController extends Cubit<ForgotPasswordState> {
  final AuthService authService;

  ForgotPasswordController(this.authService)
      : super(const ForgotPasswordState.initial());

  void sendEmailToResetPassword(String email) async {
    emit(
      state.copyWith(forgotPasswordStatus: ForgotPasswordStatus.loading),
    );
    try {
      final emailWasSent = await authService.sendEmailToResetPassword(email);
      if (emailWasSent) {
        emit(
          state.copyWith(forgotPasswordStatus: ForgotPasswordStatus.success),
        );
        backToLogin();
      } else {
        emit(
          state.copyWith(forgotPasswordStatus: ForgotPasswordStatus.error),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(forgotPasswordStatus: ForgotPasswordStatus.error),
      );
    }
  }

  void backToLogin() {
    Modular.to.popUntil(
      ModalRoute.withName('/login'),
    );
  }
}
