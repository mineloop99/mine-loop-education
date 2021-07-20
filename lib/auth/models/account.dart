import 'package:flutter/foundation.dart';

enum StudentClasses {
  PrimarySchool,
  JuniorHighSchool,
  HighSchool,
  University,
}
enum StudentSubjects {
  Maths,
  Physics,
  Chemistry,
  Biology,
  Geography,
  FineArt,
  Literature,
  History,
  Informatics,
  Music,
  ForeignLanguage,
}
enum Gender {
  Male,
  Female,
  Other,
}

class AuthInformation {
  const AuthInformation({
    @required this.token,
    @required this.expiryDate,
  });
  final String token;
  final DateTime expiryDate;
}

class AccountInformation {
  AccountInformation({
    this.accountName,
    this.phoneNumber,
    this.accountEmail,
    this.birthDay,
    this.gender,
    this.subjects,
  });
  String accountName;
  Gender gender;
  DateTime birthDay;
  List<StudentSubjects> subjects;
  String accountEmail;
  int phoneNumber;
}
