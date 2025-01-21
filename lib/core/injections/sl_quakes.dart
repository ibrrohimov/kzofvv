import 'package:seysmoprognoz/features/earthquakes/data/_index.dart';
import 'package:seysmoprognoz/features/earthquakes/domain/_index.dart';
import 'package:seysmoprognoz/features/earthquakes/presentation/bloc/quakes_bloc.dart';
import 'package:seysmoprognoz/features/earthquakes/presentation/bloc/quakes_all_bloc.dart';

import 'sl.dart';

Future setUpQuakesSl() async {
  // Bloc
  sl.registerFactory<QuakesBloc>(
    () => QuakesBloc(getQuakesUsecase: sl()),
  );
  sl.registerFactory<QuakesAllBloc>(
    () => QuakesAllBloc(getQuakesUsecase: sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => GetQuakesUsecase(sl()));

  // Repository
  sl.registerLazySingleton<QuakesRepository>(
    () => QuakesRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<EarthquakesRemoteDataSource>(
    () => EarthquakesRemoteDataSourceImpl(
      dio: sl(),
    ),
  );
}
