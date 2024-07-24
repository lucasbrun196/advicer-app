import '../../domain/entities/new_user.dart';

class NewUserDto implements NewUser {
  @override
  String firstName;

  @override
  String lastName;

  @override
  String email;

  @override
  String password;

  NewUserDto({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  NewUserDto copyWith(
      {String? firstName, String? lastName, String? email, String? password}) {
    return NewUserDto(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  static Map<String, dynamic> toMap(NewUser newuser) {
    return <String, dynamic>{
      'firstname': newuser.firstName,
      'lastname': newuser.lastName,
      'email': newuser.email
    };
  }
}
