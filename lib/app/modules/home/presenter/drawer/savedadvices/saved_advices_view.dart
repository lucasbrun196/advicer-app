import 'package:advicer_app/app/modules/home/presenter/drawer/savedadvices/controller/saved_advices_controller.dart';
import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter/material.dart';
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
          title: const Text("Your advices"),
        ),
        body: BlocBuilder<SavedAdvicesController, SavedAdvicesState>(
          bloc: widget.controller,
          builder: (context, state) {
            if (widget.controller.state.advicesList.isNotEmpty &&
                state.savedAdvicesStatus == SavedAdvicesStatus.success) {
              return ListView.separated(
                itemBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemCount: widget.controller.state.advicesList.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Card(
                    color: Colors.black12,
                    child:
                        Text(widget.controller.state.advicesList[index].advice),
                  );
                },
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
