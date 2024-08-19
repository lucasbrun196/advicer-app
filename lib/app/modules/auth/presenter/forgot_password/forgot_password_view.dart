import 'package:advicer_app/app/modules/auth/presenter/forgot_password/controller/forgot_password_controller.dart';
import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ForgotPasswordView extends StatefulWidget {
  final ForgotPasswordController controller;
  const ForgotPasswordView({super.key, required this.controller});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final _formKey = GlobalKey<FormState>();
  final _textEditingControllerEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return BlocListener<ForgotPasswordController, ForgotPasswordState>(
      bloc: widget.controller,
      listenWhen: (previous, current) =>
          previous.forgotPasswordStatus != current.forgotPasswordStatus,
      listener: (context, state) {
        if (state.forgotPasswordStatus == ForgotPasswordStatus.error) {
          return AsukaSnackbar.alert(state.errorMessage!).show();
        } else if (state.forgotPasswordStatus == ForgotPasswordStatus.success) {
          return AsukaSnackbar.success(
                  'An email was sent to you, check you inbox')
              .show();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Modular.to.popUntil(
                ModalRoute.withName('/login'),
              );
            },
          ),
          centerTitle: true,
          title: const Text(
            'Reset your password',
            style: TextStyle(
                fontFamily: 'Montserrat', fontWeight: FontWeight.w600),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 26, vertical: 75),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Fill in your email to change your password',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Form(
                    key: _formKey,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        hintStyle: TextStyle(
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      controller: _textEditingControllerEmail,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'this field is required';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              BlocBuilder<ForgotPasswordController, ForgotPasswordState>(
                bloc: widget.controller,
                builder: (context, state) {
                  if (state.forgotPasswordStatus ==
                      ForgotPasswordStatus.loading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Color.fromRGBO(108, 91, 164, 1),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              SizedBox(
                height: 50,
                width: screenSize.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(elevation: 5),
                  onPressed: () {
                    widget.controller.sendEmailToResetPassword(
                        _textEditingControllerEmail.text);
                    _textEditingControllerEmail.text = '';
                  },
                  child: const Text(
                    'Create account',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
