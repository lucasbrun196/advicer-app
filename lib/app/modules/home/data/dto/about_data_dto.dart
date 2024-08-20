import 'package:advicer_app/app/modules/home/domain/entities/about_data.dart';

class AboutDataDto implements AboutData {
  @override
  String description;

  @override
  String version;

  AboutDataDto({
    required this.version,
    required this.description,
  });

  AboutDataDto copyWith({
    String? version,
    String? description,
  }) {
    return AboutDataDto(
      version: version ?? this.version,
      description: description ?? this.description,
    );
  }

  factory AboutDataDto.fromMap(Map<String, dynamic> map) {
    return AboutDataDto(
      version: map["version"] as String,
      description: map["description"] as String,
    );
  }
}
