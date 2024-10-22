import 'package:advicer_app/app/modules/home/presenter/drawer/savedadvices/controller/saved_advices_controller.dart';
import 'package:asuka/asuka.dart';
import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedAdvicesView extends StatefulWidget {
  final SavedAdvicesController controller;
  const SavedAdvicesView({super.key, required this.controller});

  @override
  State<SavedAdvicesView> createState() => _SavedAdvicesViewState();
}

class _SavedAdvicesViewState extends State<SavedAdvicesView> {
  @override
  void initState() {
    widget.controller.getAdvicesList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SavedAdvicesController, SavedAdvicesState>(
      bloc: widget.controller,
      listenWhen: (previous, current) =>
          previous.savedAdvicesStatus != current.savedAdvicesStatus,
      listener: (context, state) {
        if (widget.controller.state.savedAdvicesStatus ==
            SavedAdvicesStatus.error) {
          AsukaSnackbar.alert(
            state.errorMessage!,
            elevation: 5,
          ).show();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          actions: [
            BlocBuilder<SavedAdvicesController, SavedAdvicesState>(
              bloc: widget.controller,
              builder: (context, state) {
                if (state.savedAdvicesStatus == SavedAdvicesStatus.success &&
                    widget.controller.state.markedCheckBoxes!.contains(true)) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: IconButton(
                      onPressed: () {
                        //function to delete
                      },
                      icon: const Icon(
                        size: 28,
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
          title: const Text(
            "Your advices",
            style: TextStyle(fontFamily: 'Montserrat'),
          ),
        ),
        body: BlocBuilder<SavedAdvicesController, SavedAdvicesState>(
          bloc: widget.controller,
          builder: (context, state) {
            if (widget.controller.state.advicesList.isNotEmpty &&
                state.savedAdvicesStatus == SavedAdvicesStatus.success) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) =>
                      const Divider(),
                  itemCount: widget.controller.state.advicesList.length + 1,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 70,
                      child: BlocBuilder<SavedAdvicesController,
                          SavedAdvicesState>(
                        bloc: widget.controller,
                        builder: (context, state) {
                          return Row(
                            children: [
                              Checkbox(
                                value: widget
                                    .controller.state.markedCheckBoxes![index],
                                onChanged: (value) {
                                  setState(() {
                                    widget.controller.state
                                        .markedCheckBoxes![index] = value!;
                                  });
                                },
                              ),
                              Flexible(
                                child: Text(
                                  style: const TextStyle(
                                      fontSize: 15, fontFamily: 'Montserrat'),
                                  widget.controller.state.advicesList[index]
                                      .advice,
                                  overflow: TextOverflow.clip,
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    );
                  },
                ),
              );
            } else if (state.savedAdvicesStatus == SavedAdvicesStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
