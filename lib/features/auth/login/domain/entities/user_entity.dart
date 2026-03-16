class UserEntity {
  final String userName;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? dateOfBirth;
  final String? middleName;

  const UserEntity({
    required this.userName,
    this.firstName,
    this.lastName,
    this.email,
    this.dateOfBirth,
    this.middleName,
  });
}
