part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required bool initial,
    required bool authenticated,
    required bool unauthenticated,
    required User user,
    required Failure failure,
  }) = _AuthState;

  factory AuthState.initial() => _AuthState(
        authenticated: false,
        initial: true,
        unauthenticated: false,
        user: User.empty(),
        failure: Failure.none(),
      );
}
