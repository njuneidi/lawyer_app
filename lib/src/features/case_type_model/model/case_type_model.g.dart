// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'case_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CaseTypeModel _$$_CaseTypeModelFromJson(Map<String, dynamic> json) =>
    _$_CaseTypeModel(
      id: json['id'] as int? ?? -1,
      title: json['title'] as String,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      updatedDate: json['updatedDate'] == null
          ? null
          : DateTime.parse(json['updatedDate'] as String),
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$$_CaseTypeModelToJson(_$_CaseTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'date': instance.date?.toIso8601String(),
      'updatedDate': instance.updatedDate?.toIso8601String(),
      'description': instance.description,
    };
