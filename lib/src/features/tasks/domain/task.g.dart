// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Task _$$_TaskFromJson(Map<String, dynamic> json) => _$_Task(
      id: json['id'] as int? ?? -1,
      title: json['title'] as String,
      type: json['type'] as String? ?? '',
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      updatedDate: json['updatedDate'] == null
          ? null
          : DateTime.parse(json['updatedDate'] as String),
      transportationTime: json['transportationTime'] == null
          ? null
          : DateTime.parse(json['transportationTime'] as String),
      description: json['description'] as String? ?? '',
      internalNote: json['internalNote'] as String? ?? '',
      status: json['status'] as String? ?? '',
      rate: json['rate'] as String? ?? '',
      calcuatedRate: json['calcuatedRate'] as String? ?? '',
      clientID: json['clientID'] as String? ?? '',
      clientName: json['clientName'] as String? ?? '',
      caseID: json['caseID'] as String? ?? '',
      caseTitle: json['caseTitle'] as String? ?? '',
      advocateID: json['advocateID'] as String? ?? '',
      advocateName: json['advocateName'] as String? ?? '',
      documentID: json['documentID'] as String? ?? '',
      updatedAt: json['updatedAt'] as String? ?? '',
      archivedAt: json['archivedAt'] as String? ?? '',
      isDeleted: json['isDeleted'] as bool? ?? false,
    );

Map<String, dynamic> _$$_TaskToJson(_$_Task instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': instance.type,
      'startDate': instance.startDate?.toIso8601String(),
      'createdDate': instance.createdDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'updatedDate': instance.updatedDate?.toIso8601String(),
      'transportationTime': instance.transportationTime?.toIso8601String(),
      'description': instance.description,
      'internalNote': instance.internalNote,
      'status': instance.status,
      'rate': instance.rate,
      'calcuatedRate': instance.calcuatedRate,
      'clientID': instance.clientID,
      'clientName': instance.clientName,
      'caseID': instance.caseID,
      'caseTitle': instance.caseTitle,
      'advocateID': instance.advocateID,
      'advocateName': instance.advocateName,
      'documentID': instance.documentID,
      'updatedAt': instance.updatedAt,
      'archivedAt': instance.archivedAt,
      'isDeleted': instance.isDeleted,
    };
