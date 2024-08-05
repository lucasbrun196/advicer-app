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
    final screenSize = MediaQuery.of(context).size;
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
                  children: [
                    const DrawerHeader(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(108, 91, 164, 0.354),
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
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () async {
                              await modal(context);
                            },
                            child: const ListTile(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Logout'),
                                  Icon(Icons.logout),
                                ],
                              ),
                            ),
                          ),
                          const Divider(
                            color: Color.fromRGBO(108, 91, 164, 0.354),
                            thickness: 0.5,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(119, 99, 81, 159),
                        ),
                        height: 140,
                        width: screenSize.width,
                        child: const Column(
                          children: [],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                      height: 130,
                      width: 130,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text('ADVICE'),
                      ))
                ],
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  Future<bool?> modal(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => Dialog(
        child: SizedBox(
          height: 150,
          width: 60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Are you sure you want to leave?',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const Icon(
                Icons.logout,
                color: Color.fromRGBO(99, 81, 159, 1),
              ),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      width: 0.2,
                      color: Color.fromRGBO(99, 81, 159, 1),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            width: 0.2,
                            color: Color.fromRGBO(99, 81, 159, 1),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 34),
                        child: TextButton(
                          onPressed: () async {
                            Navigator.of(context).pop();
                            widget.controller.logout();
                          },
                          child: const Text('Yes'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 34),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('No'),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ).then((value) {
      Navigator.of(context).pop();
      return null;
    });
  }
}
