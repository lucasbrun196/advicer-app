import 'package:advicer_app/app/modules/home/domain/services/home_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'saved_advices_state.dart';

class SavedAdvicesController extends Cubit<SavedAdvicesState> {
  final HomeService homeService;
  SavedAdvicesController(this.homeService)
      : super(const SavedAdvicesState.inital());
}
