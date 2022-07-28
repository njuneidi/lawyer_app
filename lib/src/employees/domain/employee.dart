import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee.g.dart';

part 'employee.freezed.dart';

@freezed
class Employee  with _$Employee {
  const factory Employee(
      {@Default(-1) int id,
      required String name,
      @Default('') String address,
      DateTime? paidToDate,
      DateTime? lastLoginAt,
      DateTime? createdAt,
      DateTime? updatedAt,
      DateTime? archivedAt,
      DateTime? dob,
      @Default('') address1,
      @Default('') country,
      @Default(0) balance,
      @Default(0) creditBalance,
      @Default('') vatNumber,
      @Default('') idNumber,
      @Default(false) bool isDeleted,
      @Default('') String contacts,
      @Default('') String contactName,
      @Default('') String email,
      @Default('') String mobile,
      @Default('') String state,
      @Default('') String phone,
      @Default('') String taskRate,
      @Default('') String publicNotes,
      @Default('') String privateNotes,
      @Default('') String currency,
      @Default('') String gender,
      @Default('') String custom2,
      @Default('') String custom3,
      @Default('') String custom4,
      @Default('') String assignedToId,
      @Default('') String createdById,
      @Default('') String documents,
      @Default('') String city,
      @Default('') String group
      //required int yummyness,
      }) = _Employee;

  factory Employee.fromJson(Map<String, dynamic> json) => _$EmployeeFromJson(json);
}
