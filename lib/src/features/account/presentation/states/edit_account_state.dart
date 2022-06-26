abstract class EditAccountState {
  const EditAccountState();
}

class EditAccountInitial extends EditAccountState {
  const EditAccountInitial();
}

class EditAccountLoading extends EditAccountState {
  const EditAccountLoading();
}

class EditAccountLoaded extends EditAccountState {
  const EditAccountLoaded();
}

class EditAccountError extends EditAccountState {
  const EditAccountError();
}
