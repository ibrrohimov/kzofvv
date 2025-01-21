part of '../_index.dart';

class GetQuakesUsecase extends UseCase<List<QuakeModel>, QuakeParamsModel> {
  final QuakesRepository repository;

  GetQuakesUsecase(this.repository);

  @override
  Future<Either<Failure, List<QuakeModel>>> call(
      QuakeParamsModel params) async {
    return await repository.getQuakes(params);
  }
}
