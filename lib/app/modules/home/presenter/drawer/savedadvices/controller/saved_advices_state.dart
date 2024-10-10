part of 'saved_advices_controller.dart';

enum SavedAdvicesStatus { inital, loading, success, error }

class SavedAdvicesState extends Equatable {
  final SavedAdvicesStatus savedAdvicesStatus;
  final String? errorMessage;
  final List<AdviceData> advicesList;

  const SavedAdvicesState(
      {required this.savedAdvicesStatus,
      this.errorMessage,
      required this.advicesList});

  @override
  List<Object?> get props => [savedAdvicesStatus, errorMessage, advicesList];

  SavedAdvicesState.inital()
      : this(
            savedAdvicesStatus: SavedAdvicesStatus.inital,
            errorMessage: null,
            advicesList: []);

  SavedAdvicesState copyWith(
      {SavedAdvicesStatus? savedAdvicesStatus,
      String? errorMessage,
      List<AdviceData>? advicesList}) {
    return SavedAdvicesState(
      savedAdvicesStatus: savedAdvicesStatus ?? this.savedAdvicesStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      advicesList: advicesList ?? this.advicesList,
    );
  }
}
