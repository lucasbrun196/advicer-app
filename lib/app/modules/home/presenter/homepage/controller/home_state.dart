part of 'home_controller.dart';

enum HomeStatus { initial, loading, success, error }

enum GetAdviceStatus { initial, success, loading, error }

class HomeState extends Equatable {
  final HomeStatus homeStatus;
  final String userName;
  final String? adviceMessage;
  final GetAdviceStatus getAdviceStatus;

  const HomeState({
    required this.homeStatus,
    required this.userName,
    this.adviceMessage,
    required this.getAdviceStatus,
  });

  @override
  List<Object?> get props => [
        homeStatus,
        userName,
        adviceMessage,
        getAdviceStatus,
      ];

  const HomeState.initial()
      : this(
          homeStatus: HomeStatus.initial,
          userName: '',
          adviceMessage: null,
          getAdviceStatus: GetAdviceStatus.initial,
        );

  HomeState copyWith({
    HomeStatus? homeStatus,
    String? userName,
    String? adviceMessage,
    GetAdviceStatus? getAdviceStatus,
  }) {
    return HomeState(
      homeStatus: homeStatus ?? this.homeStatus,
      userName: userName ?? this.userName,
      adviceMessage: adviceMessage ?? this.adviceMessage,
      getAdviceStatus: getAdviceStatus ?? this.getAdviceStatus,
    );
  }
}
