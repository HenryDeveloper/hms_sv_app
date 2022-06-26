import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hms_sv_app/src/features/account/presentation/states/edit_account_state.dart';

class EditAccountController
    extends StateController<AsyncValue<EditAccountState>> {
  EditAccountController()
      : super(const AsyncData<EditAccountInitial>(EditAccountInitial()));

  Future<void> initialize() async {}
}
