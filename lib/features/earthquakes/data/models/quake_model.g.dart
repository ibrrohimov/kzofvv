// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quake_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuakeModel _$$_QuakeModelFromJson(Map<String, dynamic> json) =>
    _$_QuakeModel(
      content: json['content'] as String? ?? "Default content",
      contentRu: json['contentRu'] as String? ?? "Default content RU",
      regName: json['regName'] as String? ?? "Country",
      regNameRu: json['regNameRu'] as String? ?? "Country RU",
      sezildimi: json['sezildimi'] as int? ?? 0,
      depth: (json['depth'] as num?)?.toDouble() ?? 155.0,
      magnitude: (json['magnitude'] as num?)?.toDouble() ?? 5.5,
      localTime: json['localTime'] as String? ?? "08:45:30",
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0.0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0.0,
      telegramMessageId: json['telegramMessageId'] as String? ?? '12233',
      vaqt: json['vaqt'] as String? ?? '2023-08-02',
    );

Map<String, dynamic> _$$_QuakeModelToJson(_$_QuakeModel instance) =>
    <String, dynamic>{
      'content': instance.content,
      'contentRu': instance.contentRu,
      'regName': instance.regName,
      'regNameRu': instance.regNameRu,
      'sezildimi': instance.sezildimi,
      'depth': instance.depth,
      'magnitude': instance.magnitude,
      'localTime': instance.localTime,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'telegramMessageId': instance.telegramMessageId,
      'vaqt': instance.vaqt,
    };
