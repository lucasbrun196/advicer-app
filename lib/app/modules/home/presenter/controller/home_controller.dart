import 'package:advicer_app/app/modules/home/domain/services/home_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeController extends Cubit<HomeState> {
  final HomeService homeService;
  HomeController(this.homeService) : super(const HomeState.initial());

  void getUserData() async {
    emit(
      state.copyWith(homeStatus: HomeStatus.loading),
    );
    try {
      final userUid = await homeService.getCurrentUserUid();
      final user = await homeService.getUserData(userUid);
      emit(
        state.copyWith(
            userName: user.firstName, homeStatus: HomeStatus.success),
      );
    } catch (e) {
      emit(
        state.copyWith(homeStatus: HomeStatus.error),
      );
    }
  }
}