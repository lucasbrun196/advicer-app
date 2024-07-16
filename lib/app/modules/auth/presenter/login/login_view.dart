import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _textEditingControllerEmail = TextEditingController();
  final _textEditingControllerPassword = TextEditingController();

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
                            controller: _textEditingControllerEmail,
                            autocorrect: false,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Password',
                              icon: Icon(Icons.password_rounded),
                            ),
                            controller: _textEditingControllerPassword,
                            autocorrect: false,
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
                        onPressed: () {},
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
