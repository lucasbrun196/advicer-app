import 'package:advicer_app/app/modules/home/domain/services/home_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/advice_data.dart';
part 'saved_advices_state.dart';

class SavedAdvicesController extends Cubit<SavedAdvicesState> {
  final HomeService homeService;
  SavedAdvicesController(this.homeService) : super(SavedAdvicesState.inital());

  void getAdvicesList() async {
    emit(state.copyWith(savedAdvicesStatus: SavedAdvicesStatus.loading));
    try {
      List<AdviceData> advicesList = await homeService.getSavedAdvices();
      List<bool> initialCheckBoxes = List.filled(advicesList.length, false);
      emit(
        state.copyWith(
          advicesList: advicesList,
          savedAdvicesStatus: SavedAdvicesStatus.success,
          markedCheckBoxes: initialCheckBoxes,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
            savedAdvicesStatus: SavedAdvicesStatus.error,
            errorMessage: "You don't have any saved advice"),
      );
    }
  }

  void deleteAdvices() {
    emit(state.copyWith(savedAdvicesStatus: SavedAdvicesStatus.loading));
    try {
      for (int i = 0; i < state.markedCheckBoxes.length; i++) {
        if (state.markedCheckBoxes[i]) {
          homeService.deleteAdvice(state.advicesList[i].id.toString());
          state.advicesList.removeAt(i);
        }
      }
      List<bool> initialCheckBoxes =
          List.filled(state.advicesList.length, false);

      emit(state.copyWith(
          savedAdvicesStatus: SavedAdvicesStatus.success,
          markedCheckBoxes: initialCheckBoxes));
    } catch (e) {
      emit(state.copyWith(
          savedAdvicesStatus: SavedAdvicesStatus.error,
          errorMessage: 'Can`t delete'));
    }
  }
}
