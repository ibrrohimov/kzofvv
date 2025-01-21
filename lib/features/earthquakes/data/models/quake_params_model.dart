import 'package:freezed_annotation/freezed_annotation.dart';
part 'quake_params_model.freezed.dart';
part 'quake_params_model.g.dart';

@freezed
abstract class QuakeParamsModel with _$QuakeParamsModel {
  factory QuakeParamsModel({
    @Default(10) int? size,
    int? sezildimi,
    @Default(0) int? page,
    String? regName,
    String? vaqt,
    String? latitude,
    String? longtitude,
    String? magnitude,
    String? depth,
  }) = _QuakeParamsModel;
  factory QuakeParamsModel.fromJson(Map<String, dynamic> json) =>
      _$QuakeParamsModelFromJson(json);
}
