part of 'home_controller.dart';

enum HomeStatus { initial, loading, success, error }

enum GetAdviceStatus { initial, success, loading, error }

class HomeState extends Equatable {
  final HomeStatus homeStatus;
  final String userName;
  final String? adviceMessage;
  final GetAdviceStatus getAdviceStatus;
  final String? errorMessage;

  const HomeState({
    required this.homeStatus,
    required this.userName,
    this.adviceMessage,
    required this.getAdviceStatus,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
        homeStatus,
        userName,
        adviceMessage,
        getAdviceStatus,
        errorMessage,
      ];

  const HomeState.initial()
      : this(
          homeStatus: HomeStatus.initial,
          userName: '',
          adviceMessage: null,
          getAdviceStatus: GetAdviceStatus.initial,
          errorMessage: 'Error',
        );

  HomeState copyWith({
    HomeStatus? homeStatus,
    String? userName,
    String? adviceMessage,
    GetAdviceStatus? getAdviceStatus,
    String? errorMessage,
  }) {
    return HomeState(
      homeStatus: homeStatus ?? this.homeStatus,
      userName: userName ?? this.userName,
      adviceMessage: adviceMessage ?? this.adviceMessage,
      getAdviceStatus: getAdviceStatus ?? this.getAdviceStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
