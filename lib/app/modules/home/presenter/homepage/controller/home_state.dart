part of 'home_controller.dart';

enum HomeStatus { initial, loading, success, error }

enum GetAdviceStatus { initial, success, loading, error }

enum SaveAdviceStatus { initial, success, loading, error }

enum DeleteAdviceStatus { initial, success, loading, error }

class HomeState extends Equatable {
  final HomeStatus homeStatus;
  final String userName;
  final String? adviceMessage;
  final int? adviceId;
  final GetAdviceStatus getAdviceStatus;
  final String? errorMessage;
  final bool isLiked;
  final SaveAdviceStatus saveAdviceStatus;
  final DeleteAdviceStatus deleteAdviceStatus;

  const HomeState({
    required this.homeStatus,
    required this.userName,
    this.adviceMessage,
    this.adviceId,
    required this.getAdviceStatus,
    this.errorMessage,
    required this.isLiked,
    required this.saveAdviceStatus,
    required this.deleteAdviceStatus,
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
        deleteAdviceStatus
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
          deleteAdviceStatus: DeleteAdviceStatus.initial,
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
    DeleteAdviceStatus? deleteAdviceStatus,
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
      deleteAdviceStatus: deleteAdviceStatus ?? this.deleteAdviceStatus,
    );
  }
}
