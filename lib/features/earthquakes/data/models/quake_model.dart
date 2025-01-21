import 'package:freezed_annotation/freezed_annotation.dart';
part 'quake_model.freezed.dart';
part 'quake_model.g.dart';

@freezed
abstract class QuakeModel with _$QuakeModel {
  factory QuakeModel({
    @Default("Default content") String content,
    @Default("Default content RU") String contentRu,
    @Default("Country") String regName,
    @Default("Country RU") String regNameRu,
    @Default(0) int sezildimi,
    @Default(155.0) double depth,
    @Default(5.5) double magnitude,
    @Default("08:45:30") String localTime,
    @Default(0.0) double latitude,
    @Default(0.0) double longitude,
    @Default('12233') String telegramMessageId,
    @Default('2023-08-02') String vaqt,
  }) = _QuakeModel;
  factory QuakeModel.fromJson(Map<String, dynamic> json) =>
      _$QuakeModelFromJson(json);
}
