// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Case _$CaseFromJson(Map<String, dynamic> json) {
  return _Case.fromJson(json);
}

/// @nodoc
class _$CaseTearOff {
  const _$CaseTearOff();

  _Case call(
      {int id = -1,
      required String title,
      DateTime? date,
      DateTime? updatedDate,
      String description = '',
      String clientID = '',
      String clientName = '',
      String attachmentID = '',
      String type = '',
      String others = '',
      String taskID = ''}) {
    return _Case(
      id: id,
      title: title,
      date: date,
      updatedDate: updatedDate,
      description: description,
      clientID: clientID,
      clientName: clientName,
      attachmentID: attachmentID,
      type: type,
      others: others,
      taskID: taskID,
    );
  }

  Case fromJson(Map<String, Object?> json) {
    return Case.fromJson(json);
  }
}

/// @nodoc
const $Case = _$CaseTearOff();

/// @nodoc
mixin _$Case {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  DateTime? get updatedDate => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get clientID => throw _privateConstructorUsedError;
  String get clientName => throw _privateConstructorUsedError;
  String get attachmentID =>
      throw _privateConstructorUsedError; //PlatformFile  attachment,
  String get type => throw _privateConstructorUsedError;
  String get others => throw _privateConstructorUsedError;
  String get taskID => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CaseCopyWith<Case> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CaseCopyWith<$Res> {
  factory $CaseCopyWith(Case value, $Res Function(Case) then) =
      _$CaseCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String title,
      DateTime? date,
      DateTime? updatedDate,
      String description,
      String clientID,
      String clientName,
      String attachmentID,
      String type,
      String others,
      String taskID});
}

/// @nodoc
class _$CaseCopyWithImpl<$Res> implements $CaseCopyWith<$Res> {
  _$CaseCopyWithImpl(this._value, this._then);

  final Case _value;
  // ignore: unused_field
  final $Res Function(Case) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? date = freezed,
    Object? updatedDate = freezed,
    Object? description = freezed,
    Object? clientID = freezed,
    Object? clientName = freezed,
    Object? attachmentID = freezed,
    Object? type = freezed,
    Object? others = freezed,
    Object? taskID = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedDate: updatedDate == freezed
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      clientID: clientID == freezed
          ? _value.clientID
          : clientID // ignore: cast_nullable_to_non_nullable
              as String,
      clientName: clientName == freezed
          ? _value.clientName
          : clientName // ignore: cast_nullable_to_non_nullable
              as String,
      attachmentID: attachmentID == freezed
          ? _value.attachmentID
          : attachmentID // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      others: others == freezed
          ? _value.others
          : others // ignore: cast_nullable_to_non_nullable
              as String,
      taskID: taskID == freezed
          ? _value.taskID
          : taskID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$CaseCopyWith<$Res> implements $CaseCopyWith<$Res> {
  factory _$CaseCopyWith(_Case value, $Res Function(_Case) then) =
      __$CaseCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String title,
      DateTime? date,
      DateTime? updatedDate,
      String description,
      String clientID,
      String clientName,
      String attachmentID,
      String type,
      String others,
      String taskID});
}

/// @nodoc
class __$CaseCopyWithImpl<$Res> extends _$CaseCopyWithImpl<$Res>
    implements _$CaseCopyWith<$Res> {
  __$CaseCopyWithImpl(_Case _value, $Res Function(_Case) _then)
      : super(_value, (v) => _then(v as _Case));

  @override
  _Case get _value => super._value as _Case;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? date = freezed,
    Object? updatedDate = freezed,
    Object? description = freezed,
    Object? clientID = freezed,
    Object? clientName = freezed,
    Object? attachmentID = freezed,
    Object? type = freezed,
    Object? others = freezed,
    Object? taskID = freezed,
  }) {
    return _then(_Case(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedDate: updatedDate == freezed
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      clientID: clientID == freezed
          ? _value.clientID
          : clientID // ignore: cast_nullable_to_non_nullable
              as String,
      clientName: clientName == freezed
          ? _value.clientName
          : clientName // ignore: cast_nullable_to_non_nullable
              as String,
      attachmentID: attachmentID == freezed
          ? _value.attachmentID
          : attachmentID // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      others: others == freezed
          ? _value.others
          : others // ignore: cast_nullable_to_non_nullable
              as String,
      taskID: taskID == freezed
          ? _value.taskID
          : taskID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Case implements _Case {
  _$_Case(
      {this.id = -1,
      required this.title,
      this.date,
      this.updatedDate,
      this.description = '',
      this.clientID = '',
      this.clientName = '',
      this.attachmentID = '',
      this.type = '',
      this.others = '',
      this.taskID = ''});

  factory _$_Case.fromJson(Map<String, dynamic> json) => _$$_CaseFromJson(json);

  @JsonKey()
  @override
  final int id;
  @override
  final String title;
  @override
  final DateTime? date;
  @override
  final DateTime? updatedDate;
  @JsonKey()
  @override
  final String description;
  @JsonKey()
  @override
  final String clientID;
  @JsonKey()
  @override
  final String clientName;
  @JsonKey()
  @override
  final String attachmentID;
  @JsonKey()
  @override //PlatformFile  attachment,
  final String type;
  @JsonKey()
  @override
  final String others;
  @JsonKey()
  @override
  final String taskID;

  @override
  String toString() {
    return 'Case(id: $id, title: $title, date: $date, updatedDate: $updatedDate, description: $description, clientID: $clientID, clientName: $clientName, attachmentID: $attachmentID, type: $type, others: $others, taskID: $taskID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Case &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality()
                .equals(other.updatedDate, updatedDate) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.clientID, clientID) &&
            const DeepCollectionEquality()
                .equals(other.clientName, clientName) &&
            const DeepCollectionEquality()
                .equals(other.attachmentID, attachmentID) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.others, others) &&
            const DeepCollectionEquality().equals(other.taskID, taskID));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(updatedDate),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(clientID),
      const DeepCollectionEquality().hash(clientName),
      const DeepCollectionEquality().hash(attachmentID),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(others),
      const DeepCollectionEquality().hash(taskID));

  @JsonKey(ignore: true)
  @override
  _$CaseCopyWith<_Case> get copyWith =>
      __$CaseCopyWithImpl<_Case>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CaseToJson(this);
  }
}

abstract class _Case implements Case {
  factory _Case(
      {int id,
      required String title,
      DateTime? date,
      DateTime? updatedDate,
      String description,
      String clientID,
      String clientName,
      String attachmentID,
      String type,
      String others,
      String taskID}) = _$_Case;

  factory _Case.fromJson(Map<String, dynamic> json) = _$_Case.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  DateTime? get date;
  @override
  DateTime? get updatedDate;
  @override
  String get description;
  @override
  String get clientID;
  @override
  String get clientName;
  @override
  String get attachmentID;
  @override //PlatformFile  attachment,
  String get type;
  @override
  String get others;
  @override
  String get taskID;
  @override
  @JsonKey(ignore: true)
  _$CaseCopyWith<_Case> get copyWith => throw _privateConstructorUsedError;
}
