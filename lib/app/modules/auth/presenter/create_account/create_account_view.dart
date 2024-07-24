import 'package:advicer_app/app/modules/auth/domain/entities/new_user.dart';
import 'package:advicer_app/app/modules/auth/presenter/create_account/controller/create_account_controller.dart';
import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAccountView extends StatefulWidget {
  final CreateAccountController controller;
  const CreateAccountView({super.key, required this.controller});

  @override
  State<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  final _textEditingControllerFirstName = TextEditingController();
  final _textEditingControllerLastName = TextEditingController();
  final _textEditingControllerEmail = TextEditingController();
  final _textEditingControllerPassword = TextEditingController();
  final newUser = NewUser(firstName: '', lastName: '', email: '', password: '');
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return BlocListener<CreateAccountController, CreateAccountState>(
      bloc: widget.controller,
      listenWhen: (previous, current) =>
          previous.createAccountStatus != current.createAccountStatus,
      listener: (context, state) {
        if (state.createAccountStatus == CreateAccountStatus.error) {
          return AsukaSnackbar.alert('Error when create account').show();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              widget.controller.backToLogin();
            },
          ),
          centerTitle: true,
          title: const Text('Create your account'),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 26, vertical: 75),
          child: BlocBuilder<CreateAccountController, CreateAccountState>(
            bloc: widget.controller,
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(hintText: 'First name'),
                          controller: _textEditingControllerFirstName,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'this field is required';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(hintText: 'Last name'),
                          controller: _textEditingControllerLastName,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'this field is required';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(hintText: 'Email'),
                          controller: _textEditingControllerEmail,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'this field is required';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(hintText: 'Password'),
                          controller: _textEditingControllerPassword,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'this field is required';
                            }
                            if (value.length < 8) {
                              return 'your password must have more than 5 characters';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  BlocBuilder<CreateAccountController, CreateAccountState>(
                    bloc: widget.controller,
                    builder: (context, state) {
                      if (state.createAccountStatus ==
                          CreateAccountStatus.loading) {
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
                        if (_formKey.currentState!.validate()) {
                          newUser.firstName =
                              _textEditingControllerFirstName.text;
                          newUser.lastName =
                              _textEditingControllerLastName.text;
                          newUser.email = _textEditingControllerEmail.text;
                          newUser.password =
                              _textEditingControllerPassword.text;
                          widget.controller.createAccount(newUser);
                        }
                      },
                      child: const Text('Create account'),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
