part of '../_index.dart';

class QuakesRepositoryImpl implements QuakesRepository {
  final EarthquakesRemoteDataSource remoteDataSource;

  QuakesRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<QuakeModel>>> getQuakes(params) async {
    try {
      final quakes = await remoteDataSource.getQuakes(params);
      return Right(quakes);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
