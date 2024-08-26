part of 'home_controller.dart';

enum HomeStatus { initial, loading, success, error }

enum GetAdviceStatus { initial, success, loading, error }

class HomeState extends Equatable {
  final HomeStatus homeStatus;
  final String userName;
  final String? adviceMessage;
  final GetAdviceStatus getAdviceStatus;
  final String? errorMessage;
  final bool isLiked;

  const HomeState({
    required this.homeStatus,
    required this.userName,
    this.adviceMessage,
    required this.getAdviceStatus,
    this.errorMessage,
    required this.isLiked,
  });

  @override
  List<Object?> get props => [
        homeStatus,
        userName,
        adviceMessage,
        getAdviceStatus,
        errorMessage,
        isLiked,
      ];

  const HomeState.initial()
      : this(
          homeStatus: HomeStatus.initial,
          userName: '',
          adviceMessage: null,
          getAdviceStatus: GetAdviceStatus.initial,
          errorMessage: 'Error',
          isLiked: false,
        );

  HomeState copyWith({
    HomeStatus? homeStatus,
    String? userName,
    String? adviceMessage,
    GetAdviceStatus? getAdviceStatus,
    String? errorMessage,
    String? assetImage,
    bool? isLiked,
  }) {
    return HomeState(
      homeStatus: homeStatus ?? this.homeStatus,
      userName: userName ?? this.userName,
      adviceMessage: adviceMessage ?? this.adviceMessage,
      getAdviceStatus: getAdviceStatus ?? this.getAdviceStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      isLiked: isLiked ?? this.isLiked,
    );
  }
}
