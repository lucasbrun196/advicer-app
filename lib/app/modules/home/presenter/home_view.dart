import 'package:advicer_app/app/modules/home/presenter/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  final HomeController controller;
  const HomeView({super.key, required this.controller});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    widget.controller.getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeController, HomeState>(
      bloc: widget.controller,
      builder: (context, state) {
        if (state.homeStatus == HomeStatus.success) {
          return Scaffold(
            appBar: AppBar(
              title: Text(' Hello ${widget.controller.state.userName}'),
            ),
            drawer: const Drawer(),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
