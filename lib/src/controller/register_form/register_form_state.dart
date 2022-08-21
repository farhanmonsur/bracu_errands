part of 'register_form_bloc.dart';

@freezed
class RegisterFormState with _$RegisterFormState {
  const factory RegisterFormState({
    required String name,
    required String emailAddress,
    required String phone,
    required String password,
    required Option<ValueFailure<String>> emailError,
    required Option<ValueFailure<String>> passwordError,
    required bool isSubmitting,
    required bool showErrorMessages,
    required Option<Either<Failure, User>> authFailureOrSuccessOption,
  }) = _RegisterFormState;

  factory RegisterFormState.initial() => RegisterFormState(
        name: '',
        emailAddress: '',
        phone: '',
        password: '',
        emailError: none(),
        passwordError: none(),
        isSubmitting: false,
        showErrorMessages: false,
        authFailureOrSuccessOption: none(),
      );
}
