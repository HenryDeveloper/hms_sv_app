abstract class IUpdateAccountService {
  Future<void> updateProfile();
}

class UpdateAccountService implements IUpdateAccountService {
  @override
  Future<void> updateProfile() async {}
}
