import 'package:advicer_app/app/modules/auth/domain/entities/user_info.dart';
import 'package:advicer_app/app/modules/auth/presenter/login/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginView extends StatefulWidget {
  final LoginController controller;
  const LoginView({super.key, required this.controller});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _textEditingControllerEmail = TextEditingController();
  final _textEditingControllerPassword = TextEditingController();
  final UserInfos userInfo = UserInfos(email: '', password: '');
  bool _passWordIsVisible = false;

  void _hidePassword(bool passWordStatus) {
    setState(() {
      _passWordIsVisible = passWordStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
          child: Column(
            children: [
              Image.asset(
                alignment: Alignment.topCenter,
                'assets/dialog_ballon.jpeg',
                height: 220,
              ),
              SizedBox(
                height: 450,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Form(
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Email',
                              icon: Icon(Icons.email),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            controller: _textEditingControllerEmail,
                            autocorrect: false,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: 'Password',
                                    icon: Icon(Icons.password_rounded),
                                  ),
                                  obscureText: !_passWordIsVisible,
                                  keyboardType: TextInputType.visiblePassword,
                                  controller: _textEditingControllerPassword,
                                  autocorrect: false,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  if (_passWordIsVisible == true) {
                                    _hidePassword(false);
                                  } else {
                                    _hidePassword(true);
                                  }
                                },
                                icon: SvgPicture.asset(
                                    _passWordIsVisible == true
                                        ? 'assets/show_password.svg'
                                        : 'assets/hide_password.svg'),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: 220,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(elevation: 5),
                        onPressed: () {
                          userInfo.email = _textEditingControllerEmail.text;
                          userInfo.password =
                              _textEditingControllerPassword.text;
                          widget.controller.login(userInfo);
                        },
                        child: const Text('Login'),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 50,
                      width: 220,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text('Create account'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
