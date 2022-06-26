import 'package:hms_sv_app/src/features/account/domain/model/account_info.dart';
import 'package:hms_sv_app/src/utils/enums/gender.dart';

class AccountInfoViewModel {
  final String firstName;
  final String lastName;
  final String countryArea;
  final String phoneNumber;
  final Gender? gender;

  AccountInfoViewModel(
      this.firstName, this.lastName, this.phoneNumber, this.countryArea,
      {this.gender});

  AccountInfo convertToModel() =>
      AccountInfo(firstName, lastName, phoneNumber, countryArea,
          gender: gender);
}
