part of '../_index.dart';

abstract class QuakesRepository {
  Future<Either<Failure, List<QuakeModel>>> getQuakes(QuakeParamsModel params);
}
