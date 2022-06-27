import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hms_sv_app/src/features/account/application/account_service.dart';
import 'package:hms_sv_app/src/features/account/domain/view_model/account_info_view_model.dart';

class EditAccountController
    extends StateController<AsyncValue<AccountInfoViewModel?>> {
  final IAccountService _accountService;
  EditAccountController(this._accountService) : super(const AsyncData(null));

  Future<AccountInfoViewModel> initialize() async {
    var profile = await _accountService.getProfile();

    return AccountInfoViewModel(profile.firstName, profile.lastName,
        countryArea: profile.countryArea,
        phoneNumber: profile.phoneNumber,
        gender: profile.gender);
  }
}
