import 'package:bracu_errands/src/model/errand.dart';
import 'package:bracu_errands/src/model/failure/failure.dart';
import 'package:dartz/dartz.dart';

abstract class IErrandRepository {
  Future<Either<Failure, Errand>> postErrand({required String description});

  Future<Either<Failure, List<Errand>>> getErrands();

  Future<Either<Failure, Errand>> getErrandById(String errandId);

  Future<Either<Failure, List<Errand>>> getErrandsByPerformerId(
      String performerId);

  Future<Either<Failure, Errand>> acceptErrandById(
      String errandId, String performerId);

  Future<Either<Failure, Errand>> completeErrandById(String errandId);
}
