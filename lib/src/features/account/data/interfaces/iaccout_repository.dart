import 'package:hms_sv_app/src/features/account/domain/model/account_info.dart';

abstract class IAccountRepository {
  Future<AccountInfo> getAccount();
  Future<bool> updateAccountInfo(AccountInfo accountInfo);
  Future<bool> validatePassword(String oldPassword);
  Future<bool> updatePassword(String newPassword);
}
