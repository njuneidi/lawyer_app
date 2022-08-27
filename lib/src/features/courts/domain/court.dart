import 'package:freezed_annotation/freezed_annotation.dart';

part 'court.g.dart';

part 'court.freezed.dart';

@freezed
class Court  with _$Court {
  const factory Court(
      {@Default(-1) int id,
      required String name,
      
      @Default('') String address,
      @Default('') String location,
      @Default('') String phone,
     
      @Default('') String city,
     
     
      }) = _Court;

  factory Court.fromJson(Map<String, dynamic> json) => _$CourtFromJson(json);


}
