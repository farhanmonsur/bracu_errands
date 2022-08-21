part of 'register_form_bloc.dart';

@freezed
class RegisterFormEvent with _$RegisterFormEvent {
  const factory RegisterFormEvent.nameChanged(String nameStr) = NameChanged;

  const factory RegisterFormEvent.emailChanged(String emailStr) = EmailChanged;

  const factory RegisterFormEvent.phoneChanged(String phoneStr) = PhoneChanged;

  const factory RegisterFormEvent.passwordChanged(String passwordStr) =
      PasswordChanged;

  const factory RegisterFormEvent.registerWithEmailAndPasswordPressed() =
      RegisterWithEmailAndPasswordPressed;
}
