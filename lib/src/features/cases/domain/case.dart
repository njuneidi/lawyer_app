import 'package:freezed_annotation/freezed_annotation.dart';

part 'case.g.dart';

part 'case.freezed.dart';

@freezed
class Case  with _$Case {
  const factory Case(
      {@Default(-1) int id,
      required String title,
      DateTime? date,
      @Default('') String description,
      @Default('') String clientID,
      @Default('') String attachmentID,
      //PlatformFile  attachment,
      @Default('') String type,
      @Default('') String others,
      @Default('') String taskID,
     

     
     
      }) = _Case;

  factory Case.fromJson(Map<String, dynamic> json) => _$CaseFromJson(json);


}
