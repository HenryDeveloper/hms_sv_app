import 'package:hms_sv_app/src/features/account/data/interfaces/iaccout_repository.dart';
import 'package:hms_sv_app/src/features/account/domain/model/account_info.dart';

abstract class IAccountService {
  Future<AccountInfo> getProfile();
  Future<void> updateProfile();
}

class AccountService implements IAccountService {
  final IAccountRepository _accountRepository;
  AccountService(this._accountRepository);

  @override
  Future<void> updateProfile() async {}

  @override
  Future<AccountInfo> getProfile() async => _accountRepository.getAccount();
}
