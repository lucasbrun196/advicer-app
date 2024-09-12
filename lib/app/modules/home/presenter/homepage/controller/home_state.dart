part of 'home_controller.dart';

enum HomeStatus { initial, loading, success, error }

enum GetAdviceStatus { initial, success, loading, error }

enum SaveAdviceStatus { initial, success, loading, error }

class HomeState extends Equatable {
  final HomeStatus homeStatus;
  final String userName;
  final String? adviceMessage;
  final int? adviceId;
  final GetAdviceStatus getAdviceStatus;
  final String? errorMessage;
  final bool isLiked;
  final SaveAdviceStatus saveAdviceStatus;

  const HomeState({
    required this.homeStatus,
    required this.userName,
    this.adviceMessage,
    this.adviceId,
    required this.getAdviceStatus,
    this.errorMessage,
    required this.isLiked,
    required this.saveAdviceStatus,
  });

  @override
  List<Object?> get props => [
        homeStatus,
        userName,
        adviceMessage,
        getAdviceStatus,
        errorMessage,
        isLiked,
        saveAdviceStatus,
        adviceId,
      ];

  const HomeState.initial()
      : this(
          homeStatus: HomeStatus.initial,
          userName: '',
          adviceMessage: null,
          adviceId: null,
          getAdviceStatus: GetAdviceStatus.initial,
          errorMessage: 'Error',
          isLiked: false,
          saveAdviceStatus: SaveAdviceStatus.initial,
        );

  HomeState copyWith({
    HomeStatus? homeStatus,
    String? userName,
    String? adviceMessage,
    int? adviceId,
    GetAdviceStatus? getAdviceStatus,
    String? errorMessage,
    String? assetImage,
    bool? isLiked,
    SaveAdviceStatus? saveAdviceStatus,
  }) {
    return HomeState(
      homeStatus: homeStatus ?? this.homeStatus,
      userName: userName ?? this.userName,
      adviceMessage: adviceMessage ?? this.adviceMessage,
      adviceId: adviceId ?? this.adviceId,
      getAdviceStatus: getAdviceStatus ?? this.getAdviceStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      isLiked: isLiked ?? this.isLiked,
      saveAdviceStatus: saveAdviceStatus ?? this.saveAdviceStatus,
    );
  }
}
