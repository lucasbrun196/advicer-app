import 'package:advicer_app/app/modules/auth/domain/services/auth_service.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    await authService.checkInternet().then((has) async {
      if (has) {
        try {
          await authService.sendEmailToResetPassword(email);
          emit(
            state.copyWith(forgotPasswordStatus: ForgotPasswordStatus.success),
          );
        } on FirebaseAuthException catch (e) {
          emit(
            state.copyWith(
              forgotPasswordStatus: ForgotPasswordStatus.error,
              errorMessage: e.message,
            ),
          );
        } catch (e) {
          emit(
            state.copyWith(forgotPasswordStatus: ForgotPasswordStatus.error),
          );
        }
      } else {
        emit(
          state.copyWith(
            forgotPasswordStatus: ForgotPasswordStatus.error,
            errorMessage: 'Check you internet connection',
          ),
        );
      }
    });
  }

  void backToLogin() {
    Modular.to.popUntil(
      ModalRoute.withName('/login'),
    );
  }
}
