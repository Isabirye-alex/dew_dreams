class MemberEntity {
  final String firstMemberName;
  final String lastMemberName;
  final String dateOfBirth;
  final String memberMiddleName;
  String? email;
  final String contact;

  MemberEntity({
    required this.contact,
    required this.dateOfBirth,
    required this.memberMiddleName,
    required this.firstMemberName,
    required this.lastMemberName,
  });
}
