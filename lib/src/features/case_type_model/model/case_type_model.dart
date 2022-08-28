import 'package:freezed_annotation/freezed_annotation.dart';

part 'case_type_model.g.dart';

part 'case_type_model.freezed.dart';

@freezed
class CaseTypeModel with _$CaseTypeModel {
  factory CaseTypeModel({
    @Default(-1) int id,
    required String title,
    DateTime? date,
    DateTime? updatedDate,
    @Default('') String description,
   // @Default('') String clientID,

  }) = _CaseTypeModel;

  factory CaseTypeModel.fromJson(Map<String, dynamic> json) => _$CaseTypeModelFromJson(json);
}
