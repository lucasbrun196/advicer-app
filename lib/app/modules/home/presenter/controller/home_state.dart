part of 'home_controller.dart';

enum HomeStatus { initial, loading, success, error }

class HomeState extends Equatable {
  final HomeStatus homeStatus;

  const HomeState({required this.homeStatus});

  @override
  List<Object?> get props => [homeStatus];

  const HomeState.initial() : this(homeStatus: HomeStatus.initial);

  HomeState copyWith({
    HomeStatus? homeStatus,
  }) {
    return HomeState(
      homeStatus: homeStatus ?? this.homeStatus,
    );
  }
}
