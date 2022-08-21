import 'package:bloc/bloc.dart';
import 'package:bracu_errands/src/model/core/failures.dart';
import 'package:bracu_errands/src/model/core/value_validators.dart';
import 'package:bracu_errands/src/model/failure/failure.dart';
import 'package:bracu_errands/src/model/user.dart';
import 'package:bracu_errands/src/respository/i_auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'register_form_bloc.freezed.dart';
part 'register_form_event.dart';
part 'register_form_state.dart';

@injectable
class RegisterFormBloc extends Bloc<RegisterFormEvent, RegisterFormState> {
  RegisterFormBloc(this._authRepository) : super(RegisterFormState.initial()) {
    on<NameChanged>((event, emit) {
      emit(
        state.copyWith(
          name: event.nameStr.trim(),
          authFailureOrSuccessOption: none(),
        ),
      );
    });

    on<EmailChanged>((event, emit) {
      emit(
        state.copyWith(
          emailAddress: event.emailStr.trim(),
          emailError: validateEmailAddress(event.emailStr.trim()),
          authFailureOrSuccessOption: none(),
        ),
      );
    });

    on<PhoneChanged>((event, emit) {
      emit(
        state.copyWith(
          phone: event.phoneStr.trim(),
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

    on<RegisterWithEmailAndPasswordPressed>((event, emit) async {
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

        failureOrSuccess = await _authRepository.registerWithEmailAndPassword(
          name: state.name.trim(),
          email: state.emailAddress,
          password: state.password,
          phone: state.phone,
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
