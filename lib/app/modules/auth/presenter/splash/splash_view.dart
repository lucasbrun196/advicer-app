import 'package:advicer_app/app/modules/auth/presenter/splash/controller/splash_controller.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  final SplashController controller;
  const SplashView({super.key, required this.controller});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    widget.controller.userIsAvaliable();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                color: const Color.fromARGB(150, 0, 0, 0),
                'assets/dialog_ballon.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
