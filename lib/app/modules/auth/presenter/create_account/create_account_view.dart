import 'package:advicer_app/app/modules/auth/domain/entities/new_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({super.key});

  @override
  State<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  final _textEditingControllerFirstName = TextEditingController();
  final _textEditingControllerLastName = TextEditingController();
  final _textEditingControllerEmail = TextEditingController();
  final _textEditingControllerPassword = TextEditingController();
  final newUser = NewUser(firstName: '', lastName: '', email: '', password: '');

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Modular.to.popUntil(
              ModalRoute.withName('/login'),
            );
          },
        ),
        centerTitle: true,
        title: const Text('Create your account'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 26, vertical: 75),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Form(
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'First name'),
                    controller: _textEditingControllerFirstName,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'Last name'),
                    controller: _textEditingControllerLastName,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'Email'),
                    controller: _textEditingControllerEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'Password'),
                    controller: _textEditingControllerPassword,
                    keyboardType: TextInputType.text,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
              width: screenSize.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(elevation: 5),
                onPressed: () {
                  newUser.firstName = _textEditingControllerFirstName.text;
                  newUser.lastName = _textEditingControllerLastName.text;
                  newUser.email = _textEditingControllerEmail.text;
                  newUser.password = _textEditingControllerPassword.text;
                },
                child: const Text('Create account'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
