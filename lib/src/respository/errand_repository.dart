import 'package:bracu_errands/src/respository/api_helper.dart';
import 'package:bracu_errands/src/model/errand.dart';
import 'package:bracu_errands/src/model/failure/failure.dart';
import 'package:bracu_errands/src/respository/i_errand_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IErrandRepository)
class ErrandRepository implements IErrandRepository {
  final _api = ApiHelper.instance();

  @override
  Future<Either<Failure, Errand>> postErrand({
    required String description,
  }) async {
    final body = {'description': description};

    final requestedErrand = await _api.post<Errand>(
      fromJson: (json) => Errand.fromJson(json),
      endPoint: '/errands',
      body: body,
    );
    return requestedErrand.fold(
      (f) => left(Failure(errorCode: f.errorCode, message: f.message)),
      right,
    );
  }

  @override
  Future<Either<Failure, List<Errand>>> getErrands() async {
    final orders = await _api.get<List<Errand>>(
      fromJson: (json) => (json['results'] as List)
          .map(
            (dynamic order) => Errand.fromJson(order as Map<String, dynamic>),
          )
          .toList(),
      endPoint: '/errands',
    );
    return orders.fold(
      (f) => left(Failure(errorCode: f.errorCode, message: f.message)),
      right,
    );
  }

  @override
  Future<Either<Failure, List<Errand>>> getErrandsByPerformerId(
      String performerId) async {
    final orders = await _api.get<List<Errand>>(
      fromJson: (json) => (json['results'] as List)
          .map(
            (dynamic order) => Errand.fromJson(order as Map<String, dynamic>),
          )
          .toList(),
      endPoint: '/errands?performerId=$performerId',
    );
    return orders.fold(
      (f) => left(Failure(errorCode: f.errorCode, message: f.message)),
      right,
    );
  }

  @override
  Future<Either<Failure, Errand>> getErrandById(String errandId) async {
    final order = await _api.get<Errand>(
      fromJson: (json) => Errand.fromJson(json),
      endPoint: '/errands/$errandId',
    );
    return order.fold(
      (f) => left(Failure(errorCode: f.errorCode, message: f.message)),
      right,
    );
  }

  @override
  Future<Either<Failure, Errand>> acceptErrandById(
      String errandId, String performerId) async {
    final body = {'performerId': performerId, 'isActive': true};
    final order = await _api.patch<Errand>(
      fromJson: (json) => Errand.fromJson(json!),
      body: body,
      endPoint: '/errands/$errandId',
    );
    return order.fold(
      (f) => left(Failure(errorCode: f.errorCode, message: f.message)),
      right,
    );
  }

  @override
  Future<Either<Failure, Errand>> completeErrandById(String errandId) async {
    final order = await _api.patch<Errand>(
      fromJson: (json) => Errand.fromJson(json!),
      body: {'isActive': false, 'isComplete': true},
      endPoint: '/errands/$errandId',
    );
    return order.fold(
      (f) => left(Failure(errorCode: f.errorCode, message: f.message)),
      right,
    );
  }
}
