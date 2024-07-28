part of 'splash_controller.dart';

enum SplashStatus { initial, loading, success, error }

class SplashState extends Equatable {
  final SplashStatus splashStatus;

  const SplashState({
    required this.splashStatus,
  });

  @override
  List<Object?> get props => [
        splashStatus,
      ];

  const SplashState.initial() : this(splashStatus: SplashStatus.initial);

  SplashState copyWith({
    SplashStatus? splashStatus,
  }) {
    return SplashState(
      splashStatus: splashStatus ?? this.splashStatus,
    );
  }
}
