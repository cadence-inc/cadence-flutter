class AccountModel {
  final String name;
  final String birthday;
  final String city;
  final String userId;
  final String phoneNumber;
  final bool isDeleted;

  AccountModel({
    required this.name,
    required this.birthday,
    required this.city,
    required this.userId,
    required this.phoneNumber,
    required this.isDeleted,
  });
}
