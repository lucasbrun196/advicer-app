part of 'home_controller.dart';

enum HomeStatus { initial, loading, success, error }

class HomeState extends Equatable {
  final HomeStatus homeStatus;
  final String userName;

  const HomeState({required this.homeStatus, required this.userName});

  @override
  List<Object?> get props => [
        homeStatus,
        userName,
      ];

  const HomeState.initial()
      : this(homeStatus: HomeStatus.initial, userName: '');

  HomeState copyWith({
    HomeStatus? homeStatus,
    String? userName,
  }) {
    return HomeState(
      homeStatus: homeStatus ?? this.homeStatus,
      userName: userName ?? this.userName,
    );
  }
}
