import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.g.dart';

part 'task.freezed.dart';

@freezed
class Task with _$Task {
  factory Task({
    @Default(-1) int id,
    required String title,
    @Default('') String type,
    DateTime? startDate,
    DateTime? createdDate,
    DateTime? endDate,
    DateTime? updatedDate,
    DateTime? transportationTime,
    @Default('') String description,
    @Default('') String internalNote,
    @Default('') String status,
    @Default('') String rate,
    @Default('') String calcuatedRate,
    @Default('') String clientID,
    @Default('') String clientName,
    @Default('') String caseID,
    @Default('') String caseTitle,
    @Default('') String advocateID,
    @Default('') String advocateName,
    @Default('') String documentID,
    @Default('') String updatedAt,
    @Default('') String archivedAt,
    @Default(false) bool isDeleted,
    //PlatformFile  attachment,
    
    

  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}
