part of '../_index.dart';

abstract class EarthquakesRemoteDataSource {
  Future<List<QuakeModel>> getQuakes(QuakeParamsModel params);
}

class EarthquakesRemoteDataSourceImpl implements EarthquakesRemoteDataSource {
  final DioClient dio;

  EarthquakesRemoteDataSourceImpl({
    required this.dio,
  });

  @override
  Future<List<QuakeModel>> getQuakes(params) async {
    print("@@@@@@@@@@getQuakes");
    try {
      final res = await dio.post(
        Endpoints.yangilikuser,
        data: params.toJson(),
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );
      List quakes = res.data['data'];
      return quakes.map((e) => QuakeModel.fromJson(e)).toList();
    } catch (e) {
      print("@@@@@@@@@@ERRROR");
      print(e.toString());
      rethrow;
    }
  }
}
