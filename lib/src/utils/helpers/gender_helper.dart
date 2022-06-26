import 'package:hms_sv_app/src/constants/strings.dart';
import 'package:hms_sv_app/src/utils/enums/gender.dart';

class GenderHelper {
  static const Map<Gender, String> genderMap = {
    Gender.female: Strings.female,
    Gender.male: Strings.male,
    Gender.nonBinary: Strings.nonBinary,
    Gender.notToSayIt: Strings.notToSayIt
  };
}
