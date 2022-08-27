import 'package:freezed_annotation/freezed_annotation.dart';

part 'attachment.g.dart';

part 'attachment.freezed.dart';

@freezed
class Attachment  with _$Attachment {
  const factory Attachment(
      {@Default(-1) int id,
      required String name,
   
      @Default('') String type,
      @Default('') String url,
   
     

     
     
      }) = _Attachment;

  factory Attachment.fromJson(Map<String, dynamic> json) => _$AttachmentFromJson(json);


}
