import 'package:bracu_errands/src/model/failure/failure.dart';
import 'package:bracu_errands/src/model/user.dart';
import 'package:dartz/dartz.dart';

abstract class IAuthRepository {
  Future<Option<String>> hasUserId();

  Future<Option<Failure>> isEmailValid(String email);

  Future<Either<Failure, User>> getUserById(String userId);

  Future<Either<Failure, User>> registerWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required String phone,
  });

  Future<Either<Failure, User>> loginWithEmailAndPassword({
    required String emailAddress,
    required String password,
  });

  Future<void> signOut({required User user});
}
