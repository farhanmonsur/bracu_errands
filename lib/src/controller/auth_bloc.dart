// ignore_for_file: require_trailing_commas

import 'package:bloc/bloc.dart';
import 'package:bracu_errands/src/model/failure/failure.dart';
import 'package:bracu_errands/src/model/user.dart';
import 'package:bracu_errands/src/respository/i_auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._authRepository) : super(AuthState.initial()) {
    on<AuthCheckRequested>(
      (event, emit) async {
        print('auth check requested');
        final userIdOption = await _authRepository.hasUserId();

        return userIdOption.fold(
          () => emit(
            state.copyWith(
              unauthenticated: true,
              initial: false,
            ),
          ),
          (userId) async {
            final userOption = await _authRepository.getUserById(userId);
            userOption.fold(
              (failure) {
                emit(
                  state.copyWith(
                    unauthenticated: true,
                    failure: failure,
                    initial: false,
                  ),
                );
              },
              (User user) => emit(
                state.copyWith(
                  authenticated: true,
                  user: user,
                  initial: false,
                  unauthenticated: false,
                ),
              ),
            );
          },
        );
      },
    );

    on<SignedOut>((event, emit) async {
      await _authRepository.signOut(
        user: state.user,
      );
      emit(
        state.copyWith(
          unauthenticated: true,
          initial: false,
        ),
      );
    });
  }
  final IAuthRepository _authRepository;
}
