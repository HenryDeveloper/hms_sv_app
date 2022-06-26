import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:hms_sv_app/src/features/account/data/interfaces/iaccout_repository.dart';
import 'package:hms_sv_app/src/features/account/domain/model/account_info.dart';
import 'package:hms_sv_app/src/utils/enums/gender.dart';

class AccountRepository implements IAccountRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseCrashlytics _firebaseCrashlytics;

  AccountRepository(this._firebaseAuth, this._firebaseCrashlytics);

  @override
  Future<bool> updateAccountInfo(AccountInfo accountInfo) async {
    var user = _firebaseAuth.currentUser;
    try {
      await user!.updateDisplayName(accountInfo.fullName);
    } catch (e, s) {
      _firebaseCrashlytics.recordError(e, s);
      return false;
    }

    return true;
  }

  @override
  Future<bool> validatePassword(String oldPassword) async {
    var user = _firebaseAuth.currentUser!;
    var credential =
        EmailAuthProvider.credential(email: user.email!, password: oldPassword);

    var authResult = await user.reauthenticateWithCredential(credential);

    return authResult.user != null;
  }

  @override
  Future<bool> updatePassword(String newPassword) async {
    await _firebaseAuth.currentUser!.updatePassword(newPassword);
    return true;
  }

  @override
  Future<AccountInfo> getAccount() async {
    var user = _firebaseAuth.currentUser;
    if (user != null) {
      var nameParts = user.displayName?.split('-');

      return AccountInfo(nameParts![0], nameParts[1], "2257-7777", "+503",
          gender: Gender.male);
    }

    return AccountInfo("", "", "", "");
  }
}
