import 'package:advicer_app/app/modules/home/domain/entities/advice_data.dart';

class AdviceDto implements AdviceData {
  @override
  int id;

  @override
  String advice;

  AdviceDto({
    required this.id,
    required this.advice,
  });

  AdviceDto copyWith({
    int? id,
    String? advice,
  }) {
    return AdviceDto(
      id: id ?? this.id,
      advice: advice ?? this.advice,
    );
  }

  factory AdviceDto.fromMap(Map<String, dynamic> map) {
    return AdviceDto(
      id: map["id"],
      advice: map["advice"],
    );
  }
}
