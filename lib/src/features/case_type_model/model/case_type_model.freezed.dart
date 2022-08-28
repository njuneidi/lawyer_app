// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'case_type_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CaseTypeModel _$CaseTypeModelFromJson(Map<String, dynamic> json) {
  return _CaseTypeModel.fromJson(json);
}

/// @nodoc
class _$CaseTypeModelTearOff {
  const _$CaseTypeModelTearOff();

  _CaseTypeModel call(
      {int id = -1,
      required String title,
      DateTime? date,
      DateTime? updatedDate,
      String description = ''}) {
    return _CaseTypeModel(
      id: id,
      title: title,
      date: date,
      updatedDate: updatedDate,
      description: description,
    );
  }

  CaseTypeModel fromJson(Map<String, Object?> json) {
    return CaseTypeModel.fromJson(json);
  }
}

/// @nodoc
const $CaseTypeModel = _$CaseTypeModelTearOff();

/// @nodoc
mixin _$CaseTypeModel {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  DateTime? get updatedDate => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CaseTypeModelCopyWith<CaseTypeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CaseTypeModelCopyWith<$Res> {
  factory $CaseTypeModelCopyWith(
          CaseTypeModel value, $Res Function(CaseTypeModel) then) =
      _$CaseTypeModelCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String title,
      DateTime? date,
      DateTime? updatedDate,
      String description});
}

/// @nodoc
class _$CaseTypeModelCopyWithImpl<$Res>
    implements $CaseTypeModelCopyWith<$Res> {
  _$CaseTypeModelCopyWithImpl(this._value, this._then);

  final CaseTypeModel _value;
  // ignore: unused_field
  final $Res Function(CaseTypeModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? date = freezed,
    Object? updatedDate = freezed,
    Object? description = freezed,
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
    ));
  }
}

/// @nodoc
abstract class _$CaseTypeModelCopyWith<$Res>
    implements $CaseTypeModelCopyWith<$Res> {
  factory _$CaseTypeModelCopyWith(
          _CaseTypeModel value, $Res Function(_CaseTypeModel) then) =
      __$CaseTypeModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String title,
      DateTime? date,
      DateTime? updatedDate,
      String description});
}

/// @nodoc
class __$CaseTypeModelCopyWithImpl<$Res>
    extends _$CaseTypeModelCopyWithImpl<$Res>
    implements _$CaseTypeModelCopyWith<$Res> {
  __$CaseTypeModelCopyWithImpl(
      _CaseTypeModel _value, $Res Function(_CaseTypeModel) _then)
      : super(_value, (v) => _then(v as _CaseTypeModel));

  @override
  _CaseTypeModel get _value => super._value as _CaseTypeModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? date = freezed,
    Object? updatedDate = freezed,
    Object? description = freezed,
  }) {
    return _then(_CaseTypeModel(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CaseTypeModel implements _CaseTypeModel {
  _$_CaseTypeModel(
      {this.id = -1,
      required this.title,
      this.date,
      this.updatedDate,
      this.description = ''});

  factory _$_CaseTypeModel.fromJson(Map<String, dynamic> json) =>
      _$$_CaseTypeModelFromJson(json);

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

  @override
  String toString() {
    return 'CaseTypeModel(id: $id, title: $title, date: $date, updatedDate: $updatedDate, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CaseTypeModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality()
                .equals(other.updatedDate, updatedDate) &&
            const DeepCollectionEquality()
                .equals(other.description, description));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(updatedDate),
      const DeepCollectionEquality().hash(description));

  @JsonKey(ignore: true)
  @override
  _$CaseTypeModelCopyWith<_CaseTypeModel> get copyWith =>
      __$CaseTypeModelCopyWithImpl<_CaseTypeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CaseTypeModelToJson(this);
  }
}

abstract class _CaseTypeModel implements CaseTypeModel {
  factory _CaseTypeModel(
      {int id,
      required String title,
      DateTime? date,
      DateTime? updatedDate,
      String description}) = _$_CaseTypeModel;

  factory _CaseTypeModel.fromJson(Map<String, dynamic> json) =
      _$_CaseTypeModel.fromJson;

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
  @JsonKey(ignore: true)
  _$CaseTypeModelCopyWith<_CaseTypeModel> get copyWith =>
      throw _privateConstructorUsedError;
}
