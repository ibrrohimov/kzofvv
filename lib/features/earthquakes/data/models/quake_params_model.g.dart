// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quake_params_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuakeParamsModel _$$_QuakeParamsModelFromJson(Map<String, dynamic> json) =>
    _$_QuakeParamsModel(
      size: json['size'] as int? ?? 10,
      sezildimi: json['sezildimi'] as int?,
      page: json['page'] as int? ?? 0,
      regName: json['regName'] as String?,
      vaqt: json['vaqt'] as String?,
      latitude: json['latitude'] as String?,
      longtitude: json['longtitude'] as String?,
      magnitude: json['magnitude'] as String?,
      depth: json['depth'] as String?,
    );

Map<String, dynamic> _$$_QuakeParamsModelToJson(_$_QuakeParamsModel instance) =>
    <String, dynamic>{
      'size': instance.size,
      'sezildimi': instance.sezildimi,
      'page': instance.page,
      'regName': instance.regName,
      'vaqt': instance.vaqt,
      'latitude': instance.latitude,
      'longtitude': instance.longtitude,
      'magnitude': instance.magnitude,
      'depth': instance.depth,
    };
