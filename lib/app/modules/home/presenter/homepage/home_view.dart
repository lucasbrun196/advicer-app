import 'package:advicer_app/app/modules/home/presenter/homepage/controller/home_controller.dart';
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
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: Text(' Hello ${widget.controller.state.userName}'),
              ),
              drawer: Drawer(
                child: ListView(
                  children: const [
                    DrawerHeader(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(108, 91, 164, 1),
                      ),
                      child: Text(
                        'Advicer',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12, right: 12),
                      child: Column(
                        children: [
                          ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Logout'),
                                Icon(Icons.logout),
                              ],
                            ),
                          ),
                          Divider(color: Color.fromRGBO(108, 91, 164, 1)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
