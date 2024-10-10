part of 'saved_advices_controller.dart';

enum SavedAdvicesStatus { inital, loading, success, error }

class SavedAdvicesState extends Equatable {
  final SavedAdvicesStatus savedAdvicesStatus;

  const SavedAdvicesState({
    required this.savedAdvicesStatus,
  });

  @override
  List<Object?> get props => [savedAdvicesStatus];

  const SavedAdvicesState.inital()
      : this(savedAdvicesStatus: SavedAdvicesStatus.inital);

  SavedAdvicesState copyWith({SavedAdvicesStatus? savedAdvicesStatus}) {
    return SavedAdvicesState(
        savedAdvicesStatus: savedAdvicesStatus ?? this.savedAdvicesStatus);
  }
}
