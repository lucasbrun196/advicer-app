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

  @override
  Widget build(BuildContext context) {
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
        margin: const EdgeInsets.symmetric(horizontal: 26, vertical: 28),
        // color: const Color.fromARGB(43, 0, 0, 0),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'First name'),
            ),
          ],
        ),
      ),
    );
  }
}
