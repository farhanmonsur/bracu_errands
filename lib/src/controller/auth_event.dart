part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.authCheckRequested() = AuthCheckRequested;

  const factory AuthEvent.userUpdated({
    required String firstname,
    required String lastname,
    required String emailAddress,
    required String phone,
  }) = UserUpdated;

  const factory AuthEvent.passwordChanged({
    required String password,
    required String confirm,
  }) = PasswordChanged;

  const factory AuthEvent.signedOut() = SignedOut;
}
