part of 'login_form_bloc.dart';

@freezed
class LoginFormState with _$LoginFormState {
  const factory LoginFormState({
    required String emailAddress,
    required String password,
    required Option<ValueFailure<String>> emailError,
    required Option<ValueFailure<String>> passwordError,
    required bool isSubmitting,
    required bool showErrorMessages,
    required Option<Either<Failure, User>> authFailureOrSuccessOption,
  }) = _LoginFormState;

  factory LoginFormState.initial() => LoginFormState(
        emailAddress: '',
        password: '',
        emailError: none(),
        passwordError: none(),
        isSubmitting: false,
        showErrorMessages: false,
        authFailureOrSuccessOption: none(),
      );
}
