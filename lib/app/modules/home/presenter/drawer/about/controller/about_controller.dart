import 'package:advicer_app/app/modules/home/domain/entities/about_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/services/home_service.dart';

part 'about_state.dart';

class AboutController extends Cubit<AboutState> {
  final HomeService homeService;
  AboutController(this.homeService) : super(AboutState.initial());

  void getAboutDataInformationController() async {
    emit(
      state.copyWith(aboutStatus: AboutStatus.loading),
    );
    try {
      AboutData aboutdata = await homeService.getAboutDataInformation();
      emit(
        state.copyWith(aboutStatus: AboutStatus.success, aboutData: aboutdata),
      );
    } catch (e) {
      emit(
        state.copyWith(aboutStatus: AboutStatus.error),
      );
    }
  }
}
