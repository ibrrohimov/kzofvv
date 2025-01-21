import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:seysmoprognoz/core/error/failures.dart';
import 'package:seysmoprognoz/core/network/dio_client.dart';
import 'package:seysmoprognoz/core/network/endpoints.dart';
import 'package:seysmoprognoz/features/earthquakes/data/models/quake_model.dart';
import 'package:seysmoprognoz/features/earthquakes/data/models/quake_params_model.dart';
import 'package:seysmoprognoz/features/earthquakes/domain/_index.dart';

part './repositories/quakes_repository_impl.dart';
part './datasources/earthquakes_remote_data_source.dart';
