import 'package:bracu_errands/src/model/failure/failure.dart';
import 'package:bracu_errands/src/model/user.dart';
import 'package:bracu_errands/src/respository/i_auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:bracu_errands/src/respository/api_helper.dart';

@LazySingleton(as: IAuthRepository)
class AuthRepository implements IAuthRepository {
  final _api = ApiHelper.instance();
  final _storage = const FlutterSecureStorage();

  @override
  Future<Option<String>> hasUserId() async {
    final userId = await _storage.read(key: 'userId');

    if (userId != null) {
      return some(userId);
    } else {
      return none();
    }
  }

  @override
  Future<Either<Failure, User>> getUserById(String userId) async {
    final user = await _api.get<User>(
      fromJson: (json) => User.fromJson(json),
      endPoint: '/users/$userId',
    );
    return user.fold(
      (f) => left(Failure(errorCode: f.errorCode, message: f.message)),
      right,
    );
  }

  @override
  Future<Option<Failure>> isEmailValid(String email) async {
    final body = {'email': email};
    final data = await _api.post(
      fromJson: (_) {},
      body: body,
      endPoint: '/auth/email-validation',
    );
    return data.fold(
      (f) => some(Failure(errorCode: f.errorCode, message: f.message)),
      (r) => none(),
    );
  }

  @override
  Future<Either<Failure, User>> registerWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    final body = {
      'email': email,
      'password': password,
      'name': name,
      'phone': phone
    };
    final user = await _api.post<User>(
      body: body,
      fromJson: (json) {
        return User.fromJson(json['user'] as Map<String, dynamic>);
      },
      saveTokens: true,
      endPoint: '/auth/register',
    );

    return user.fold(
      (f) => left(Failure(errorCode: f.errorCode, message: f.message)),
      right,
    );
  }

  @override
  Future<Either<Failure, User>> loginWithEmailAndPassword({
    required String emailAddress,
    required String password,
  }) async {
    final body = {'email': emailAddress, 'password': password};
    final user = await _api.post<User>(
      fromJson: (json) => User.fromJson(json['user'] as Map<String, dynamic>),
      saveTokens: true,
      endPoint: '/auth/login',
      body: body,
    );
    return user.fold(
      (f) => left(Failure(errorCode: f.errorCode, message: f.message)),
      (user) async {
        return right(user);
      },
    );
  }

  @override
  Future<void> signOut({required User user}) async {
    final token = await _storage.read(key: 'refreshToken');
    final body = {'refreshToken': token};
    await _api.post<void>(
      fromJson: (_) {},
      body: body,
      endPoint: '/auth/logout',
      decode: false,
    );
    await _storage.delete(key: 'accessToken');
    await _storage.delete(key: 'refreshToken');
    await _storage.delete(key: 'userId');
    //await _api.getToken();
  }
}
