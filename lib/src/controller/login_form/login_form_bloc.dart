import 'package:bloc/bloc.dart';
import 'package:bracu_errands/src/model/core/failures.dart';
import 'package:bracu_errands/src/model/core/value_validators.dart';
import 'package:bracu_errands/src/model/failure/failure.dart';
import 'package:bracu_errands/src/model/user.dart';
import 'package:bracu_errands/src/respository/i_auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'login_form_event.dart';
part 'login_form_state.dart';
part 'login_form_bloc.freezed.dart';

@injectable
class LoginFormBloc extends Bloc<LoginFormEvent, LoginFormState> {
  LoginFormBloc(this._authRepository) : super(LoginFormState.initial()) {
    on<EmailChanged>((event, emit) {
      emit(
        state.copyWith(
          emailAddress: event.emailStr.trim(),
          emailError: validateEmailAddress(event.emailStr.trim()),
          authFailureOrSuccessOption: none(),
        ),
      );
    });

    on<PasswordChanged>((event, emit) {
      emit(
        state.copyWith(
          password: event.passwordStr.trim(),
          passwordError: validatePassword(event.passwordStr.trim()),
          authFailureOrSuccessOption: none(),
        ),
      );
    });

    on<LoginWithEmailAndPasswordPressed>((event, emit) async {
      Either<Failure, User>? failureOrSuccess;

      final isEmailValid = state.emailError.isNone();
      final isPasswordValid = state.passwordError.isNone();

      if (isEmailValid && isPasswordValid) {
        emit(
          state.copyWith(
            isSubmitting: true,
            authFailureOrSuccessOption: none(),
          ),
        );

        failureOrSuccess = await _authRepository.loginWithEmailAndPassword(
          emailAddress: state.emailAddress,
          password: state.password,
        );
      }

      emit(
        state.copyWith(
          isSubmitting: false,
          showErrorMessages: true,
          authFailureOrSuccessOption: optionOf(failureOrSuccess),
        ),
      );
    });
  }

  final IAuthRepository _authRepository;
}
