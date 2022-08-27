// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'case.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Case _$$_CaseFromJson(Map<String, dynamic> json) => _$_Case(
      id: json['id'] as int? ?? -1,
      title: json['title'] as String,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      description: json['description'] as String? ?? '',
      clientID: json['clientID'] as String? ?? '',
      attachmentID: json['attachmentID'] as String? ?? '',
      type: json['type'] as String? ?? '',
      others: json['others'] as String? ?? '',
      taskID: json['taskID'] as String? ?? '',
    );

Map<String, dynamic> _$$_CaseToJson(_$_Case instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'date': instance.date?.toIso8601String(),
      'description': instance.description,
      'clientID': instance.clientID,
      'attachmentID': instance.attachmentID,
      'type': instance.type,
      'others': instance.others,
      'taskID': instance.taskID,
    };
