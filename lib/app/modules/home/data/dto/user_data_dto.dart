import 'package:advicer_app/app/modules/home/domain/entities/advice_data.dart';
import 'package:advicer_app/app/modules/home/domain/entities/user_data.dart';

class UserDataDto implements UserData {
  @override
  String firstName;

  @override
  String lastName;

  @override
  String email;

  UserDataDto({
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  UserDataDto copyWith({String? firstName, String? lastName, String? email}) {
    return UserDataDto(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
    );
  }

  factory UserDataDto.fromMap(Map<String, dynamic> map) {
    return UserDataDto(
      firstName: map['firstname'] as String,
      lastName: map['lastname'] as String,
      email: map['email'] as String,
    );
  }
}
