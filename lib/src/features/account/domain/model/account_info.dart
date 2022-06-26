import 'package:hms_sv_app/src/utils/enums/gender.dart';

class AccountInfo {
  final String firstName;
  final String lastName;
  final String countryArea;
  final String phoneNumber;
  final Gender? gender;

  AccountInfo(this.firstName, this.lastName, this.phoneNumber, this.countryArea,
      {this.gender});

  String get fullName => "$firstName-$lastName";
}
