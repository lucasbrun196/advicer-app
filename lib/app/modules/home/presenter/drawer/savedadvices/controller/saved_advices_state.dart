part of 'saved_advices_controller.dart';

enum SavedAdvicesStatus { inital, loading, success, error }

class SavedAdvicesState extends Equatable {
  final SavedAdvicesStatus savedAdvicesStatus;
  final String? errorMessage;
  final List<AdviceData> advicesList;
  final List<bool> markedCheckBoxes;

  const SavedAdvicesState({
    required this.savedAdvicesStatus,
    this.errorMessage,
    required this.advicesList,
    required this.markedCheckBoxes,
  });

  @override
  List<Object?> get props => [
        savedAdvicesStatus,
        errorMessage,
        advicesList,
        markedCheckBoxes,
      ];

  SavedAdvicesState.inital()
      : this(
            savedAdvicesStatus: SavedAdvicesStatus.inital,
            errorMessage: null,
            advicesList: [],
            markedCheckBoxes: []);

  SavedAdvicesState copyWith({
    SavedAdvicesStatus? savedAdvicesStatus,
    String? errorMessage,
    List<AdviceData>? advicesList,
    List<bool>? markedCheckBoxes,
  }) {
    return SavedAdvicesState(
        savedAdvicesStatus: savedAdvicesStatus ?? this.savedAdvicesStatus,
        errorMessage: errorMessage ?? this.errorMessage,
        advicesList: advicesList ?? this.advicesList,
        markedCheckBoxes: markedCheckBoxes ?? this.markedCheckBoxes);
  }
}
