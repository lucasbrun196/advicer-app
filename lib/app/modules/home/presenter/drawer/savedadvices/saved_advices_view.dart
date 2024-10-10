import 'package:advicer_app/app/modules/home/presenter/drawer/savedadvices/controller/saved_advices_controller.dart';
import 'package:flutter/material.dart';

class SavedAdvicesView extends StatefulWidget {
  final SavedAdvicesController controller;
  const SavedAdvicesView({super.key, required this.controller});

  @override
  State<SavedAdvicesView> createState() => _SavedAdvicesViewState();
}

class _SavedAdvicesViewState extends State<SavedAdvicesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your saved Advices"),
      ),
    );
  }
}
