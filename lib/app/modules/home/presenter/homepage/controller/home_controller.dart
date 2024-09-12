import 'package:advicer_app/app/modules/home/domain/services/home_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'home_state.dart';

class HomeController extends Cubit<HomeState> {
  final HomeService homeService;
  HomeController(this.homeService) : super(const HomeState.initial());

  void getUserData() async {
    emit(
      state.copyWith(homeStatus: HomeStatus.loading),
    );
    await homeService.checkInternetConnection().then((has) async {
      if (has) {
        try {
          final userUid = await homeService.getCurrentUserUid();
          final user = await homeService.getUserData(userUid);
          emit(
            state.copyWith(
                userName: user.firstName, homeStatus: HomeStatus.success),
          );
        } catch (e) {
          emit(
            state.copyWith(
                homeStatus: HomeStatus.error, errorMessage: e.toString()),
          );
        }
      } else {
        emit(
          state.copyWith(
            homeStatus: HomeStatus.error,
            getAdviceStatus: GetAdviceStatus.error,
            errorMessage: 'Check yout internet connection',
          ),
        );
      }
    });
  }

  void logout() async {
    emit(
      state.copyWith(homeStatus: HomeStatus.loading),
    );
    try {
      await homeService.logout();
      emit(
        state.copyWith(homeStatus: HomeStatus.success),
      );
      Modular.to.navigate('/login');
    } catch (e) {
      emit(
        state.copyWith(
            homeStatus: HomeStatus.error, errorMessage: e.toString()),
      );
    }
  }

  void generateAdvice() async {
    emit(
      state.copyWith(getAdviceStatus: GetAdviceStatus.loading),
    );
    await homeService.checkInternetConnection().then((has) async {
      if (has) {
        try {
          await homeService.getAdvice().then((advicePromisse) => {
                adviceIsSave(),
                emit(
                  state.copyWith(
                      adviceMessage: advicePromisse.advice,
                      adviceId: advicePromisse.id,
                      getAdviceStatus: GetAdviceStatus.success),
                ),
              });
        } catch (e) {
          emit(
            state.copyWith(
                homeStatus: HomeStatus.error,
                getAdviceStatus: GetAdviceStatus.error,
                errorMessage: e.toString()),
          );
        }
      } else {
        emit(
          state.copyWith(
            homeStatus: HomeStatus.error,
            getAdviceStatus: GetAdviceStatus.error,
            errorMessage: 'Check yout internet connection',
          ),
        );
      }
    });
  }

  void navigateToAbaoutPage() {
    Modular.to.pushNamed('/home/about');
  }

  void changeLikedStatus(bool liked) {
    emit(state.copyWith(isLiked: liked));
  }

  void saveAdvice() async {
    emit(
      state.copyWith(saveAdviceStatus: SaveAdviceStatus.loading),
    );
    try {
      final savedAdvices = await homeService.checkSavedAdvices();
      if (savedAdvices.length >= 5) {
        emit(
          state.copyWith(
              saveAdviceStatus: SaveAdviceStatus.error,
              errorMessage: 'You have already 5 saved advices, delete one'),
        );
        changeLikedStatus(false);
      } else {
        await homeService.saveAdvice(state.adviceId!, state.adviceMessage!);
        emit(
          state.copyWith(saveAdviceStatus: SaveAdviceStatus.success),
        );
        changeLikedStatus(true);
      }
    } catch (e) {
      emit(
        state.copyWith(saveAdviceStatus: SaveAdviceStatus.error),
      );
    }
  }

  void adviceIsSave() async {
    bool containsAdvice;
    await homeService.checkSavedAdvices().then(
          (advicesSavedMap) => {
            containsAdvice = advicesSavedMap.containsKey(
              state.adviceId.toString(),
            ),
            emit(
              state.copyWith(isLiked: containsAdvice),
            ),
          },
        );
  }

  void deleteAdvice() async {
    emit(
      state.copyWith(deleteAdviceStatus: DeleteAdviceStatus.loading),
    );
    try {
      await homeService.deleteAdvice(
        state.adviceId.toString(),
      );
      emit(
        state.copyWith(deleteAdviceStatus: DeleteAdviceStatus.success),
      );
      changeLikedStatus(false);
    } catch (e) {
      emit(
        state.copyWith(deleteAdviceStatus: DeleteAdviceStatus.error),
      );
    }
  }
}
