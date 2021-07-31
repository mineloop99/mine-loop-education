import 'package:flutter/foundation.dart';

// enum StudentClasses {
//   PrimarySchool,
//   JuniorHighSchool,
//   HighSchool,
//   University,
// }
// enum StudentSubjects {
//   Maths,
//   Physics,
//   Chemistry,
//   Biology,
//   Geography,
//   FineArt,
//   Literature,
//   History,
//   Informatics,
//   Music,
//   ForeignLanguage,
// }
// enum Gender {
//   Male,
//   Female,
//   Other,
// }

class AuthInformation {
  const AuthInformation({
    @required this.token,
    @required this.expiryDate,
  });
  final String token;
  final DateTime expiryDate;
}

class UserInformation {
  UserInformation({
    this.name,
    this.phoneNumber,
    this.email,
    this.birthday,
    this.sex,
  });
  String name;
  String sex;
  DateTime birthday;
  String email;
  String phoneNumber;
}
