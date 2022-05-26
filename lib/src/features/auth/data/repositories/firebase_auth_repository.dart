import 'package:firebase_auth/firebase_auth.dart';
import 'package:hms_sv_app/src/features/auth/domain/model/sign_in_model.dart';
import 'package:hms_sv_app/src/features/auth/domain/model/sign_up_model.dart';

abstract class IFirebaseAuthRepository {
  Future<String?> createUser(SignUpModel model);
  Future<UserCredential> logIn(SignInModel model);
  Future<void> logOut();
}

class FirebaseAuthRepository implements IFirebaseAuthRepository {
  final FirebaseAuth firebaseAuth;

  FirebaseAuthRepository(this.firebaseAuth);

  @override
  Future<String?> createUser(SignUpModel model) async => await firebaseAuth
          .createUserWithEmailAndPassword(
              email: model.email, password: model.password)
          .then((value) async {
        await firebaseAuth.currentUser
            ?.updateDisplayName('${model.name}-${model.surname}');
        return value.additionalUserInfo?.providerId;
      });

  @override
  Future<UserCredential> logIn(SignInModel model) async => await firebaseAuth
      .signInWithEmailAndPassword(email: model.email, password: model.password);

  @override
  Future<void> logOut() async => await firebaseAuth.signOut();
}
