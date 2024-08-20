import 'package:advicer_app/app/modules/home/presenter/drawer/about/controller/about_controller.dart';
import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutView extends StatefulWidget {
  final AboutController controller;
  const AboutView({super.key, required this.controller});

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  @override
  void initState() {
    super.initState();
    widget.controller.getAboutDataInformationController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'About this app',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: BlocListener<AboutController, AboutState>(
        bloc: widget.controller,
        listenWhen: (previous, current) =>
            previous.aboutStatus != current.aboutStatus,
        listener: (context, state) {
          if (state.aboutStatus == AboutStatus.error) {
            AsukaSnackbar.alert(state.errorMessage!).show();
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              BlocBuilder<AboutController, AboutState>(
                bloc: widget.controller,
                builder: (context, state) {
                  return Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 70,
                        ),
                        Text(
                          widget.controller.state.aboutData.description,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Montserrat'),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Text(
                          widget.controller.state.aboutData.version,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              BlocBuilder<AboutController, AboutState>(
                bloc: widget.controller,
                builder: (context, state) {
                  if (state.aboutStatus == AboutStatus.loading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Color.fromRGBO(108, 91, 164, 1),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
