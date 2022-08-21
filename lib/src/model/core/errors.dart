import 'package:bracu_errands/src/model/core/failures.dart';

class NotAuthenticatedError extends Error {}

class UnexpectedValueError extends Error {
  UnexpectedValueError(this.valueFailure);
  final ValueFailure valueFailure;

  @override
  String toString() {
    const explanation =
        'Encountered a ValueFailure at an unrecoverable pont. Terminating.';

    return Error.safeToString('$explanation Failure was: $ValueFailure');
  }
}
