import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';
import 'package:seysmoprognoz/core/network/dio_client.dart';

import 'sl_quakes.dart';

final sl = GetIt.instance;

Future setUpServiceLocator() async {
  await setUpQuakesSl();

  // External
  sl.registerLazySingleton<DioClient>(() => DioClient(Dio()));
}
