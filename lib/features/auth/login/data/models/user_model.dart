import 'package:dew_dreams/features/auth/login/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  final String? userID;
  final String? password; // used only when sending login request

  UserModel({
    this.userID,
    required super.userName,
    this.password,
    super.lastName,
    super.firstName,
    super.dateOfBirth,
    super.email,
    super.middleName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userID: json['userId'] as String?,
      userName: json['username'] as String,
      lastName: json['lastName'] as String?,
      firstName: json['firstName'] as String?,
      middleName: json['middleName'] as String?,
      email: json['email'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': userName,
      if (password != null) 'password': password,
    };
  }
}
