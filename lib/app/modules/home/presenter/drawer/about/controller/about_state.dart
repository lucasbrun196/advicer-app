part of 'about_controller.dart';

enum AboutStatus { initial, loading, success, error }

class AboutState extends Equatable {
  final AboutStatus aboutStatus;
  final String? errorMessage;
  final AboutData aboutData;

  const AboutState(
      {required this.aboutStatus, this.errorMessage, required this.aboutData});

  @override
  List<Object?> get props => [aboutStatus, errorMessage, aboutData];

  AboutState.initial()
      : this(
          aboutStatus: AboutStatus.initial,
          errorMessage: 'About page error',
          aboutData: AboutData(version: '', description: ''),
        );

  AboutState copyWith(
      {AboutStatus? aboutStatus, String? errorMessage, AboutData? aboutData}) {
    return AboutState(
      aboutStatus: aboutStatus ?? this.aboutStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      aboutData: aboutData ?? this.aboutData,
    );
  }
}
