// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Client _$$_ClientFromJson(Map<String, dynamic> json) => _$_Client(
      id: json['id'] as int? ?? -1,
      name: json['name'] as String,
      address: json['address'] as String? ?? '',
      paidToDate: json['paidToDate'] == null
          ? null
          : DateTime.parse(json['paidToDate'] as String),
      lastLoginAt: json['lastLoginAt'] == null
          ? null
          : DateTime.parse(json['lastLoginAt'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      archivedAt: json['archivedAt'] == null
          ? null
          : DateTime.parse(json['archivedAt'] as String),
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      address1: json['address1'] ?? '',
      country: json['country'] ?? '',
      balance: json['balance'] ?? 0,
      creditBalance: json['creditBalance'] ?? 0,
      vatNumber: json['vatNumber'] ?? '',
      idNumber: json['idNumber'] ?? '',
      isDeleted: json['isDeleted'] as bool? ?? false,
      contacts: json['contacts'] as String? ?? '',
      contactName: json['contactName'] as String? ?? '',
      email: json['email'] as String? ?? '',
      mobile: json['mobile'] as String? ?? '',
      state: json['state'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      taskRate: json['taskRate'] as String? ?? '',
      publicNotes: json['publicNotes'] as String? ?? '',
      privateNotes: json['privateNotes'] as String? ?? '',
      currency: json['currency'] as String? ?? '',
      gender: json['gender'] as String? ?? '',
      custom2: json['custom2'] as String? ?? '',
      custom3: json['custom3'] as String? ?? '',
      custom4: json['custom4'] as String? ?? '',
      assignedToId: json['assignedToId'] as String? ?? '',
      createdById: json['createdById'] as String? ?? '',
      documents: json['documents'] as String? ?? '',
      city: json['city'] as String? ?? '',
      group: json['group'] as String? ?? '',
    );

Map<String, dynamic> _$$_ClientToJson(_$_Client instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'paidToDate': instance.paidToDate?.toIso8601String(),
      'lastLoginAt': instance.lastLoginAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'archivedAt': instance.archivedAt?.toIso8601String(),
      'dob': instance.dob?.toIso8601String(),
      'address1': instance.address1,
      'country': instance.country,
      'balance': instance.balance,
      'creditBalance': instance.creditBalance,
      'vatNumber': instance.vatNumber,
      'idNumber': instance.idNumber,
      'isDeleted': instance.isDeleted,
      'contacts': instance.contacts,
      'contactName': instance.contactName,
      'email': instance.email,
      'mobile': instance.mobile,
      'state': instance.state,
      'phone': instance.phone,
      'taskRate': instance.taskRate,
      'publicNotes': instance.publicNotes,
      'privateNotes': instance.privateNotes,
      'currency': instance.currency,
      'gender': instance.gender,
      'custom2': instance.custom2,
      'custom3': instance.custom3,
      'custom4': instance.custom4,
      'assignedToId': instance.assignedToId,
      'createdById': instance.createdById,
      'documents': instance.documents,
      'city': instance.city,
      'group': instance.group,
    };
